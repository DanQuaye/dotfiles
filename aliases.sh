# ----------------------------------------------------------------------
# ALIASES
# ----------------------------------------------------------------------

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias -- -="cd -"

# Local IP addresses
alias lip="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# WAN IP Address
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

if $(gls &>/dev/null); then
# If coreutils is installed use GNU ls with --color switch
    alias ls="gls -h --color"
    alias la="gls -ha --color"
    alias ll="gls -hl --color"
    alias lal="gls -hal --color"
fi

# Turn on colors for grep
alias grep="grep --color"

# Makes it easy to grep the ps output
alias psgrep="ps aux | grep -v grep | grep"

# cd straight to some useful directories
alias dotfiles="cd ${DOTFILES}"


