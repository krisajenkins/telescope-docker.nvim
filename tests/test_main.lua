local expect = MiniTest.expect
local child = MiniTest.new_child_neovim()

local T = MiniTest.new_set({
    hooks = {
        pre_case = function()
            child.restart({ '-u', 'scripts/minimal_init.lua' })
            child.bo.readonly = false
            child.o.lines = 40
            child.o.columns = 160

            child.cmd [[ set rtp+=deps/plenary.nvim ]]
            child.cmd [[ set rtp+=deps/telescope.nvim ]]
            child.lua [[ M = require('telescope_docker') ]]

            child.lua [=[ function slurp_test_data(filename)
          return vim.fn.readfile('tests/'..filename)
      end ]=]

            child.lua [=[
        M._make_docker_command = function(args)
            if vim.deep_equal(args, { 'ps' }) then
              return slurp_test_data('docker_ps.json')
            elseif vim.deep_equal(args, { 'images' }) then
              return slurp_test_data('docker_images.json')
            elseif vim.deep_equal(args, { 'volume', 'ls' }) then
              return slurp_test_data('docker_volume_ls.json')
            end
        end
      ]=]
        end,
        post_once = child.stop,
    },
})

T.docker_images = function()
    child.lua [[ M.docker_images() ]]
    expect.reference_screenshot(child.get_screenshot())
end

T.docker_ps = function()
    child.lua [[ M.docker_ps() ]]
    expect.reference_screenshot(child.get_screenshot())
end

T.docker_volumes = function()
    child.lua [[ M.docker_volumes() ]]
    expect.reference_screenshot(child.get_screenshot())
end

return T
