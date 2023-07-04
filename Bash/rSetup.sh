#!/bin/bash

#--[[Download]]--
#- ripgrep     
#- Node.js     
#- neoVim     
#- unzip     
#- NvChad   

#--[[Update Upgrade]]--
#sudo snap refresh && sudo apt update && sudo apt upgrade
apps = (
"unzip"
"ripgrep"
"nvim"
"node"
)

DownloadApp ()
{
  if command -v "$1" >/dev/null 2>&1; then
    echo "Already installed skipping $1"

  elif snap list | grep "^$1$" >/dev/null; then
    sudo snap install $1 --classic --edge

  elif apt list --installed | grep "^$1$" >/dev/null; then
    sudo apt install $1
  fi
}

DownloadApp(${apps[@]})
sudo snap refresh && sudo apt update && sudo apt upgrade
#git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
#nvim ~/.config/nvim/lua/custom/



