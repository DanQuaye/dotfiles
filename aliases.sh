#!/bin/bash

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Local IP addresses
alias lip="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Turn on colors for grep
alias grep="grep --color"

# By default, use normal ls and --color switch
alias ls="ls -h --color"
alias la="ls -ha --color"
alias ll="ls -hl --color"
alias lal="ls -hal --color"

# Makes it easy to grep the ps output
alias psgrep="ps aux | grep -v grep | grep"

# cd straight to some useful directories
alias dotfiles="cd ${DOTFILES}"


