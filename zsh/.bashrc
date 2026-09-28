if [ -t 0 ] && command -v zsh &> /dev/null; then
	exec zsh -l
fi
