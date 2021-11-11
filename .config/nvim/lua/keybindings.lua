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
vim.api.nvim_set_keymap('n', 'I', 'zzI', silentOpts)
vim.api.nvim_set_keymap('n', 'o', 'zzo', silentOpts)
vim.api.nvim_set_keymap('n', 'O', 'zzO', silentOpts)
vim.api.nvim_set_keymap('n', 'a', 'zza', silentOpts)
vim.api.nvim_set_keymap('n', 'A', 'zzA', silentOpts)
vim.api.nvim_set_keymap('n', 's', 'zzs', silentOpts)
vim.api.nvim_set_keymap('n', 'S', 'zzS', silentOpts)
vim.api.nvim_set_keymap('n', 'c', 'zzc', silentOpts)
vim.api.nvim_set_keymap('n', 'C', 'zzC', silentOpts)

-- Move line
vim.api.nvim_set_keymap('v', 'H', '<gv', silentOpts)
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<cr>gv=gv", silentOpts)
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<cr>gv=gv", silentOpts)
vim.api.nvim_set_keymap('v', 'L', '>gv', silentOpts)

-- Clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>Y', '"+y$', silentOpts)
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>d', '"+d', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>D', '"+D', silentOpts)
vim.api.nvim_set_keymap('v', '<leader>d', '"+d', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>P', '"+P', silentOpts)
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', silentOpts)

-- set spellcheck
vim.api.nvim_set_keymap('n', '<leader>l', ':setlocal spell spell! spelllang=en_gb<CR>', silentOpts)

-- Open windows
vim.api.nvim_set_keymap('n', '<leader>v', ':vsp .<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>h', ':sp .<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader><cr>', ':vsp <bar> terminal<cr>', silentOpts)

-- replace in line
vim.api.nvim_set_keymap('n', '<leader>s', ':s//gI<Left><Left><Left>', opts)
vim.api.nvim_set_keymap('v', '<leader>s', ':s//gI<Left><Left><Left>', opts)
-- replace in file
vim.api.nvim_set_keymap('n', '<leader>S', ':%s//gI<Left><Left><Left>', opts)
vim.api.nvim_set_keymap('v', '<leader>S', ':%s//gI<Left><Left><Left>', opts)

-- misc
vim.api.nvim_set_keymap('n', '""', 'zto""""""<Escape><Left><Left>i', silentOpts)
vim.api.nvim_set_keymap('n', 'U', '<C-R>', silentOpts)
vim.api.nvim_set_keymap('n', 'Y', 'y$', silentOpts)
