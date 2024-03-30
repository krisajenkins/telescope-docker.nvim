local health = vim.health or require 'health'

local M = {}

M.check = function()
    health.start 'Checking...'
    if vim.fn.executable('docker') == 1 then
        health.ok('Docker binary installed.')
    else
        health.error('Docker binary not fund.')
    end
end

return M
