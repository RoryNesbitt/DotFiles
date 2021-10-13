local opts = {noremap = true}
local silentOpts = {noremap = true, silent = true}

--telescope
--The rest is in telescope.lua but if I include this line it whines
vim.api.nvim_set_keymap('n', '<leader>t', ':Telescope find_files<cr>', opts)
--coc
vim.g.coc_global_extensions = 'coc-pairs'

--Which key
vim.api.nvim_set_keymap('n', '<leader>', ':WhichKey "<leader>"<cr>', opts)
vim.api.nvim_set_keymap('v', '<leader>', ':WhichKeyVisual "<leader>"<cr>', opts)

--GitGutter
vim.g.gitgutter_terminal_reports_focus=0
vim.api.nvim_set_keymap('n', '<leader>gh', ':GitGutterLineHighlightsToggle<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>gc', ':GitGutterEnable<cr>', silentOpts)

--vim-repeat
vim.cmd([[
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
]])