#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.config ~/.local/bin

# replace configs
rm -rf ~/.config/nvim ~/.config/kitty ~/.config/git ~/.zshrc ~/.bashrc
ln -s "$DIR/nvim" ~/.config/nvim
ln -s "$DIR/kitty" ~/.config/kitty
ln -s "$DIR/git" ~/.config/git
ln -s "$DIR/zsh/.zshrc" ~/.zshrc
ln -s "$DIR/zsh/.bashrc" ~/.bashrc

# oh my zsh
[ -d ~/.oh-my-zsh ] || git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

# fzf
if [ ! -f ~/.local/bin/fzf ]; then
    git clone --depth=1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --bin
    mv ~/.fzf/bin/fzf ~/.local/bin/fzf
    rm -rf ~/.fzf
fi

# kitty
if [ ! -d ~/.local/kitty.app ]; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
    ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
fi

# c_formatter_42
command -v c_formatter_42 > /dev/null || pip3 install --user git+https://github.com/dawnbeen/c_formatter_42.git

echo "Done. Open a new terminal."
