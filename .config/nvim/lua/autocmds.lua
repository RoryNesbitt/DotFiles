vim.cmd([[
    augroup tmux-reload
        autocmd!
        autocmd BufWritePost tmux.conf | !tmux source-file ~/.config/tmux/tmux.conf; tmux display-message "tmux.conf reloaded"
    augroup end
]])
