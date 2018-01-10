#!/bin/bash

function main () {
  if [ `is_installed brew` = 'false' ]; then
    xcode-install
    homebrew-install
  fi
}

function xcode-install () {
  sudo xcodebuild -license
  xcode-select --install
}
function homebrew-install () {
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
