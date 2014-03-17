#  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# grep aliases
alias grep='grep --color=auto'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# ls aliases
alias ls='ls -h --color=auto'
alias lsd='ls -F | \grep /$'
alias lsf='ls -F | \grep [^/]$'
alias l='ls -CFl'
alias ll='ls -l'
alias la='ls -a'
alias lla='la -l'
alias lld='lla -F | \grep /$'
alias llf='lla -F | \grep [^/]$'

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r |more"

# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

alias so='source ~/.bashrc'
