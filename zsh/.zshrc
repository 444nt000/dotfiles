export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	vi-mode
)

source $ZSH/oh-my-zsh.sh

alias desk="cd ~/Desktop"
alias doc="cd ~/Documents"

alias vim="nvim"
alias cf="cc -Wall -Wextra -Werror"

export EDITOR=nvim

export PATH="$HOME/.local/bin:$PATH"

# export USER=[username]
# export MAIL=[email]

command_not_found_handle() {
	printf '%s: command not found\n' "$1" >&2
	return 127
}
