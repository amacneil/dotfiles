#!/bin/sh
set -ex

ln -sf $PWD/.bash_profile ~/
ln -sf $PWD/.config/nvim ~/.config/
ln -sf $PWD/git-prompt.sh ~/.git-prompt.sh
