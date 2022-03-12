#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

set -o vi

PATH="$PATH:$HOME/.local/bin"
export npm_config_prefix="$HOME/.local"
export EDITOR=vim
export XDG_CONFIG_HOME="/home/berk/.config"

alias discord='discord --no-sandbox'
alias root='root -l'
alias KI='kinit bbalci@CERN.CH'
alias LX='ssh -Y bbalci@lxplus.cern.ch'
alias 904='ssh -Y bbalci@cms904usr'
