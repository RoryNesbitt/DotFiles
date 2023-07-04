## Always open main tmux if not in a tmux or ssh session
if [ -z "$TMUX" ] && [ -z "$SSH_CLIENT" ] && [ $(command -v tmux) ]; then
    tmux attach -t main &> /dev/null || tmux new -s main 1> /dev/null
    echo "Goodbye :)"
    while true; do
        if tmux has-session -t main 2> /dev/null; then
            tmux attach-session -t main 1> /dev/null
        else
            if tmux info &> /dev/null; then
                tmux new -s main -d 1> /dev/null
            fi
            exit
        fi
    done
fi
