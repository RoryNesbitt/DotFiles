vim.g.mapleader = ' '

vim.cmd([[
"Change cursor in different modes
if &term =~ "xterm"
    autocmd VimEnter * silent !echo -ne "\e[2 q"
    let &t_SI = "\<Esc>[6 q"                        " Insert mode       Verticle bar
    let &t_SR = "\<Esc>[4 q"                        " Replace mode      underscore
    let &t_EI = "\<Esc>[2 q"                        " Normal mode       Block
endif
]])
