# Telescope Docker 

A Docker-browsing plugin for Neovim, built on Telescope.

This is the source code from my tutorial video:

[![YouTube Thumbnail](thumbnail.jpg?raw=true)](https://youtu.be/YnTfa3Z8Z0A)


## Installation Using [Lazy](https://github.com/folke/lazy.nvim)

```lua
{
    'krisajenkins/telescope-docker.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require('telescope').load_extension('telescope_docker')
        require('telescope_docker').setup {}

        -- Example keybindings. Adjust these to suit your preferences or remove
        --   them entirely:
        vim.keymap.set(
            'n',
            '<Leader>dv',
            ':Telescope telescope_docker docker_volumes<CR>',
            { desc = '[D]ocker [V]olumes' }
        )
        vim.keymap.set(
            'n',
            '<Leader>di',
            ':Telescope telescope_docker docker_images<CR>',
            { desc = '[D]ocker [I]mages' }
        )
        vim.keymap.set(
            'n',
            '<Leader>dp',
            ':Telescope telescope_docker docker_ps<CR>',
            { desc = '[D]ocker [P]rocesses' }
        )
    end,
}
```

`<Leader>dv` will now show a **D**ocker **V**olume browser.  
`<Leader>di` will now show a **D**ocker **I**mage browser.  
`<Leader>dp` will now show a **D**ocker **P**rocess browser.  
