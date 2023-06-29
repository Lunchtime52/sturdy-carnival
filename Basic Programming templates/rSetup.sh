#!/bin/bash

#--[[Download]]--
#- ripgrep     #sudo apt install ripgrep
#- Node.js     #sudo snap install node --classic --edge
#- neoVim      #sudo snap install nvim --classic --edge
#- unzip       #sudo apt install unzip
#- NvChad      git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
#- gh          #sudo snap install gh

#--[[Update Upgrade]]--
#sudo snap refresh && sudo apt update && sudo apt upgrade


sudo snap install gh
sudo apt install unzip
sudo apt install ripgrep
sudo snap install nvim --classic --edge
sudo snap install node --classic --edge
sudo snap refresh && sudo apt update && sudo apt upgrade
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim ~/.config/nvim/lua/custom/
