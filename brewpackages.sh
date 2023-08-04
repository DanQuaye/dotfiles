#!/usr/bin/env bash

# exit when script tries to use an undeclared variable
set -o nounset
# exit if any command returns a non-zero code
#set -e

die() {
  echo "$*"
  exit 1
}

brewsetup() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

basic() {
  local basicbrews=(
    ansible
    awscli
    coreutils
    fzf
    gh
    git
    git-lfs
    kubectl
    neovim
    npm
    pyenv
    reattach-to-user-namespace
    sops
    terraform-docs
    tfenv
    tgenv
    the_silver_searcher
    tmux
    yq
  )
  for b in "${basicbrews[@]}"; do
    echo "installing ${b}"
    brew install $b
  done
}

development() {
  local developmentbrews=(
    nodenv
    node-build
    pyenv
    pyenv-virtualenv
  )
  for b in "${developmentbrews[@]}"; do
    echo "installing ${b}"
    brew install $b
  done
}

casks() {
  local caskbrews=(
    1password
    1password-cli
    docker
    iterm2
    slate
    keeper-password-manager
    vlc
    
  )
  brew tap caskroom/cask
  for b in "${caskbrews[@]}"; do
    brew install --cask $b
  done
}

main() {
  basic
  casks
  development
}

main "$@"
