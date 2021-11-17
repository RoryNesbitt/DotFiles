--VISUAL
--vim.wo.cursorline = true          -- Highlights the current line
--vim.wo.cursorcolumn = true        -- Highlights the current column
vim.cmd([[
highlight CursorLine ctermbg=black cterm=bold
highlight Cursorcolumn ctermbg=black cterm=bold
]])
vim.wo.wrap = false               -- Long lines won't wrap
vim.wo.colorcolumn = '80'         -- Adds a colour marker on the # column
vim.wo.signcolumn = 'yes'         -- Left side info column
vim.wo.scrolloff = 4              -- Keeps the cursor away from the top/bottom
vim.wo.sidescrolloff = 4          -- Keeps the cursor away from the sides

--Tabs
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.o.autoindent  = true
vim.bo.autoindent  = true
vim.o.smartindent  = true
vim.bo.smartindent  = true

--Numbers
vim.wo.number = true
vim.wo.relativenumber = true

--Search
vim.o.hlsearch = false		-- only highlight current selection
vim.o.ignorecase = true		-- ignore case when searching
vim.o.smartcase = true		-- unless search includes upercase

--History
vim.o.swapfile = false
vim.bo.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.bo.undofile = true
vim.o.hidden = true             -- Hide buffers when they are abandoned

--splitview
vim.o.splitbelow = true         -- split down
vim.o.splitright = true         -- vertical split right

--Misc
vim.o.exrc = true               -- Loads directory specific .vimrc files
vim.o.errorbells = false        -- Silence
vim.o.showmatch = true          -- Show matching brackets.
vim.o.showcmd = true            -- Show (partial) command in status line.
vim.o.wildmode = 'longest,list,full' -- Enable autocomplete files

--Marks trailing whitespace as an error
vim.cmd([[
match errorMsg /\s\+$/
]])