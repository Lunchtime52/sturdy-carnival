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
  if [ -z "$(which $1)" ]; then

    if [[$1 == "rg" ]]; then
      $1="ripgrep"
    fi

    if snap find $1 > /dev/null; then
      sudo snap install $1 --classic --edge
    else 
      sudo apt-get install $1 > /dev/null
    fi

  else
    echo "Already installed $1 skipping"
  fi

}
Chekcfile ()
{
  if [[ ! -f $1 ]]; then
    echo "Creating File $1"
    if [[ $1 == "~/.bash_aliases" ]]; then
      cp ~/sturdy-carnival/Bash/.bash_aliases ~/.bash_aliases
    else
      touch $1
    fi    
  else
    echo "The file $1 already exists."
  fi
}
Git ()
{
  echo "Please enter your GitHub Username."
  read username
  echo "Please enter your email to use with git."
  read email
  echo "Please enter your personal key."
  read key
  git config --global user.name $username
  git config --global user.email $email
  git config --global credential.username $username
  git config --global credential.password $key
  git config --global credential.helper store
  git config --global core.editor nvim
}

Chekcfile ~/.hushlogin
Chekcfile ~/.bash_aliases
for app in ${apps[@]}
do
  DownloadApp $app
done
sudo snap refresh && sudo apt update && sudo apt upgrade
#git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
#nvim ~/.config/nvim/lua/custom/
if [[ ! -f ~/.gitconfig ]]; then
  Git
fi



