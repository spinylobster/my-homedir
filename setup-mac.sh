#!/bin/bash

function main () {
  if [ `is_installed brew` = 'false' ]; then
    homebrew-install
  fi

  if [ ! -e ".git" ]; then
    git_pull
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

function is_installed () {
  which $1 > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo 'true'
  else
    echo 'false'
  fi
}

main
