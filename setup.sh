#!/bin/bash
set -eu

cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> configure vim"
(set -x; ln -sf "$PWD/vimrc" ~/.vimrc)
(set -x; mkdir -p ~/.vim/swap)
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  (set -x; curl -fsSLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)
fi

echo "==> source zshrc"
zsh_include=$(echo ". $PWD/zshrc" | sed "s|$HOME|~|")
if ! grep -q "$zsh_include" ~/.zshrc 2> /dev/null; then
    echo echo "$zsh_include" '>> ~/.zshrc'
    echo "$zsh_include" >> ~/.zshrc
fi

# https://blog.gitbutler.com/how-git-core-devs-configure-git/
echo "==> configure git"
(
  set -x
  git config --global push.default current
  git config --global push.autoSetupRemote true
  git config --global tag.sort version:refname
)
