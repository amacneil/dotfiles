#!/bin/bash -eux

cd "$(dirname "${BASH_SOURCE[0]}")"

# link config dir
mkdir -p ~/.config
ln -sf "$PWD/config/nvim" ~/.config/

# include shared bash profile
include="$(echo ". $PWD/bash_profile" | sed "s|$HOME|~|")"
if [ -z "$(grep "$include" ~/.bash_profile)" ]; then
    echo "$include" >> ~/.bash_profile
fi

# one-time git setup
./git-config.sh
