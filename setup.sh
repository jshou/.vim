#!/bin/bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# ln -s ~/.vim/vimrc ~/.vimrc
# ln -s ~/.vim/gvimrc ~/.gvimrc

nvim_config="$HOME/.config/nvim/init.vim"
mkdir -p ~/.config/nvim

if [ -e $nvim_config ]
then
    printf "File already exists: $target, backing up"
    mv "$nvim_config" "$nvim_config.backup"
fi

ln -s "$PWD/nvim_init.vim" "$nvim_config"
