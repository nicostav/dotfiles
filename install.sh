#! /bin/bash

#Download software

sudo apt update && apt upgrade

sudo apt install tmux neovim

# Create folders
mkdir ~/.config/nvim
mkdir ~/.config/nvim/lua

# Neovim
cp nvim/init.lua ~/.config/nvim/
cp nvim/plugins.lua ~/.config/nvim/lua/
cp nvim/autopairs.lua ~/.config/nvim/lua/
cp nvim/nvim-cmp.lua ~/.config/nvim/lua/
cp nvim/treesitter.lua ~/.config/nvim/lua/

# Tmux
mv tmux/tmux.conf ~/.tmux.conf