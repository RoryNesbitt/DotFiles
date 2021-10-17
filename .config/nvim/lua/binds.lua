local opts = {noremap = true}
local silentOpts = {noremap = true, silent = true}

-- LET HARDMODE=0
if HARDMODE then
    -- Disable Arrow keys in Normal mode
    vim.api.nvim_set_keymap('n', '<up>', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('n', '<down>', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('n', '<left>', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('n', '<right>', '<nop>', silentOpts)
    -- Disable hjkl in Normal mode
    vim.api.nvim_set_keymap('n', 'h', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('n', 'j', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('n', 'k', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('n', 'l', '<nop>', silentOpts)
    -- Disable Arrow keys in Insert mode
    vim.api.nvim_set_keymap('i', '<up>', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('i', '<down>', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('i', '<left>', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('i', '<right>', '<nop>', silentOpts)
end

-- Center to focus
vim.api.nvim_set_keymap('n', '{', '{zz', silentOpts)
vim.api.nvim_set_keymap('n', '}', '}zz', silentOpts)
vim.api.nvim_set_keymap('n', 'i', 'zzi', silentOpts)
vim.api.nvim_set_keymap('n', 'o', 'zzo', silentOpts)

-- Move line
vim.api.nvim_set_keymap('v', 'H', '<gv', silentOpts)
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<cr>gv=gv", silentOpts)
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<cr>gv=gv", silentOpts)
vim.api.nvim_set_keymap('v', 'L', '>gv', silentOpts)

-- Clipboard
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', silentOpts)
vim.api.nvim_set_keymap('v', '<C-x>', '"+ygvx', silentOpts)
vim.api.nvim_set_keymap('n', '<C-S-v> ', '"+p', silentOpts)
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', silentOpts)
vim.api.nvim_set_keymap('v', '<leader>x', '"+ygvx', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>v ', '"+p', silentOpts)

-- set spellcheck
vim.api.nvim_set_keymap('n', '<leader>l', ':setlocal spell spell! spelllang=en_gb<CR>', silentOpts)

-- Open windows
vim.api.nvim_set_keymap('n', '<leader>o', ':vsp .<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader><cr>', ':vsp <bar> terminal<cr>', silentOpts)

-- split navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<c-w>h', silentOpts)
vim.api.nvim_set_keymap('n', '<C-j>', '<c-w>j', silentOpts)
vim.api.nvim_set_keymap('n', '<C-k>', '<c-w>k', silentOpts)
vim.api.nvim_set_keymap('n', '<C-l>', '<c-w>l', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<cr>', silentOpts)

-- replace in line
vim.api.nvim_set_keymap('n', '<leader>s', ':s//gI<Left><Left><Left>', opts)
vim.api.nvim_set_keymap('v', '<leader>s', ':s//gI<Left><Left><Left>', opts)
-- replace in file
vim.api.nvim_set_keymap('n', '<leader>S', ':%s//gI<Left><Left><Left>', opts)
vim.api.nvim_set_keymap('v', '<leader>S', ':%s//gI<Left><Left><Left>', opts)

-- misc
vim.api.nvim_set_keymap('n', '""', ':norm zto""""""<CR><Left><Left>i', silentOpts)
vim.api.nvim_set_keymap('n', 'U', '<C-R>', silentOpts)
