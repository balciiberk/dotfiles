#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

set -o vi

export HISTSIZE=-1

PATH="$PATH:$HOME/.local/bin"
export npm_config_prefix="$HOME/.local"
export EDITOR=vim
export XDG_CONFIG_HOME="/home/berk/.config"

alias py='python3'
alias vi='vim'
alias discord='discord --no-sandbox'
alias doublex='startx /home/berk/.xinitrc_double'

#CERN
alias root='root -l --web=off'
alias KI='kinit bbalci@CERN.CH'
alias LX='ssh -Y bbalci@lxplus.cern.ch'
alias LX8='ssh -Y bbalci@lxplus8.cern.ch'
alias LX9='ssh -Y bbalci@lxplus9.cern.ch'
alias 904='ssh -Y bbalci@cms904usr'



exec fish
