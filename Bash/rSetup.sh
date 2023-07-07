#!/bin/bash

#--[[Download]]--
#- ripgrep     
#- Node.js     
#- neoVim     
#- unzip     
#- NvChad   

#--[[Update Upgrade]]--
#sudo snap refresh && sudo apt update && sudo apt upgrade
apps=(
  "unzip"
  "rg"
  "nvim"
  "node"
)

DownloadApp ()
{
  if command -v "$1" >/dev/null 2>&1; then
    echo "Already installed $1 skipping"

  elif snap find "$1" >/dev/null; then
    sudo snap install $1 --classic --edge

  elif apt-cache polcy "$1" >/dev/null; then
    sudo apt-get install $1
  fi
}
Chekcfile ()
{
  if [[ ! -f "$HOME/$1" ]]; then
    echo "Creating File $HOME/$1"
    if [[ $1 == ".bash_aliases" ]]; then
      cp .bash_aliases ~/.bash_aliases
    else
      touch ~/$1
    fi    
    else
      echo "The file $HOME/$1 already exists."
  fi
}

Chekcfile .hushlogin
Chekcfile .bash_aliases
for app in ${apps[@]}
do
  DownloadApp $app
done
sudo snap refresh && sudo apt update && sudo apt upgrade
#git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
#nvim ~/.config/nvim/lua/custom/



