require "nvchad.mappings"


local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

--terminal escape todo terminal mode -> nterminal mode (normal terminal)
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
--open float to see whole error messages: (Doesnt work ..)
map('n', '<Leader>K', function() vim.diagnostic.open_float() end)

--mappings for nvim-dap (debugging) change these
map('n', '<F5>', function() require('dap').continue() end)
map('n', '<F10>', function() require('dap').step_over() end)
map('n', '<F11>', function() require('dap').step_into() end)
map('n', '<F12>', function() require('dap').step_out() end)
map('n', '<F3>', function() require('dap').toggle_breakpoint() end)
map('n', '<F2>', function() require('dap').set_breakpoint() end)
map('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
map('n', '<Leader>dr', function() require('dap').repl.open() end)
map('n', '<Leader>dl', function() require('dap').run_last() end)
map({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
map({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
map('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
map('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
