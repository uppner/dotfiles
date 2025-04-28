# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
export EDITOR=nvim

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

alias k='sudo k3s kubectl'
alias k5='kubectl --kubeconfig ~/.kube/config.yaml'
alias vim=nvim
alias rm='echo "Use trash-put"'

alias neofetch='fastfetch --disk-show-regular false --localip-show-ipv4 false'

# If not running interactively, do not do anything
[[ $- != *i* ]] && return

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [[ -z "$TMUX" ]] && [[ ! -f /run/.toolboxenv ]]; then
  tmux a -t default || exec tmux new -s default && exit;
fi


. "$HOME/.cargo/env"
