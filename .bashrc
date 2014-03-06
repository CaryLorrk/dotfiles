## User dependent .bashrc file

if [ `hostname` != itanium ] && [ -x $HOME/local/bin/bash ]; then
    if [ $BASH != $HOME/local/bin/bash ]; then
        exec $HOME/local/bin/bash
    fi
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

## Shell setting

# Don't wait for job termination notification
set -o notify

# Vim mode
#set -o vi

# Use case-insensitive filename globbing
shopt -s nocaseglob


# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

## History setting

# for setting history length 
HISTSIZE=1000
HISTFILESIZE=2000

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# don't put duplicate lines in the history 
HISTCONTROL=ignoreboth:erasedups

# Ignore some controlling instructions
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

## Completion options

# Check for recent enough version of bash.
bash=${BASH_VERSION%.*}; bmajor=${bash%.*}; bminor=${bash#*.}
if [ $bmajor -gt 4 ] || [ $bmajor -eq 4 -a $bminor -ge 1 ]; then
    if shopt -q progcomp && [ -d $HOME/.bash/completion ]; then
        for f in $HOME/.bash/completion/*; do
            [ -f $f ] && . $f
        done
    fi
fi
unset bash bmajor bminor

##Prompt setting

RESET="\[\017\]"
NORMAL="\[\033[0m\]"
RED="\[\033[31;1m\]"
YELLOW="\[\033[01;33m\]"
GREEN="\[\033[01;32m\]"
PURPLE="\[\033[01;35m\]"
BLUE="\[\033[01;34m\]"
WHITE="\[\033[37;1m\]"
SMILEY="${GREEN}\$${NORMAL}"
FROWNY="${RED}\$${NORMAL}"
SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"

PS1="${RESET}${GREEN}\u${BLUE}@${GREEN}\h${BLUE}:${PURPLE}\w${NORMAL} \`${SELECT}\` "

## Aliases
if [ -d $HOME/.bash/aliases ]; then
    for f in $HOME/.bash/aliases/*; do
        [ -f $f ] && . $f
    done
fi

## Plugins

if [ -d $HOME/.bash/plugins ]; then
    for f in $HOME/.bash/plugins/*; do
        [ -f $f ]  && . $f
    done
fi

## Cusomization
if [ -f $HOME/.bash/custom.bash ]; then
    . $HOME/.bash/custom.bash
fi

## System files

if [ ! -d $HOME/.tmp/vim/tmp ]; then
    mkdir -p $HOME/.tmp/vim/tmp
fi

if [ ! -d $HOME/.tmp/vim/undofile ]; then
    mkdir -p $HOME/.tmp/vim/undofile
fi

if [ ! -d $HOME/.tmp/vim/backup ]; then
    mkdir -p $HOME/.tmp/vim/backup
fi

if [ ! -d $HOME/.autotags ]; then
    mkdir -p $HOME/.autotags
fi

if [ ! -d $HOME/.trash/files ]; then
    mkdir -p $HOME/.trash/files
fi

if [ ! -d $HOME/.trash/info ]; then
    mkdir -p $HOME/.trash/info
fi

stty ixany
stty ixoff -ixon
