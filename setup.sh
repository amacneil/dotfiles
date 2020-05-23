#!/bin/bash
set -eu

cd "$(dirname "${BASH_SOURCE[0]}")"

# link config dir
(
    set -x
    mkdir -p ~/.config
    ln -sf "$PWD/config/nvim" ~/.config/
)

# include bash profile
bash_include="$(echo ". $PWD/bash_profile" | sed "s|$HOME|~|")"
if [ -z "$(grep "$bash_include" ~/.bash_profile)" ]; then
    (set -x; echo "$bash_include" >> ~/.bash_profile)
fi

# include zsh profile
zsh_include="$(echo ". $PWD/zshrc" | sed "s|$HOME|~|")"
if [ -z "$(grep "$zsh_include" ~/.zshrc)" ]; then
    (set -x; echo "$zsh_include" >> ~/.zshrc)
fi

# one-time git setup
(set -x; git config --global push.default current)
