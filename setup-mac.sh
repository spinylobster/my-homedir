#!/bin/bash

function main () {
  if [ `is_installed brew` = 'false' ]; then
    homebrew-install
  fi

  if [ ! -e ".git" ]; then
    git_pull
  fi

  if [ `is_installed anyenv` = 'false' ]; then
    anyenv_install
  fi

  if [ `is_installed pyenv` = 'false' ]; then
    pyenv_install_with_anyenv
  fi

  if [ `is_installed ansible` = 'false' ]; then
    ansible_install
  fi
}

function homebrew-install () {
  sudo xcodebuild -license
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}
function git_pull () {
  git init
  git remote add origin https://github.com/spinylobster/my-homedir.git
  GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git pull -set-upstream-to origin master
  git remote set-url origin git@github.com:spinylobster/my-homedir.git
}
function anyenv_install () {
  git clone https://github.com/riywo/anyenv ~/.anyenv
  source .bash_profile
}
function pyenv_install_with_anyenv () {
  anyenv install pyenv
  source .bash_profile
  pyenv install 3.6.3
  pyenv global 3.6.3
}
function ansible_install () {
  sudo pip install ansible
}

function is_installed () {
  which $1 > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo 'true'
  else
    echo 'false'
  fi
}

main
