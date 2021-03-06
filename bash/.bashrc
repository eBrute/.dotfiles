# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=-1
#HISTFILESIZE=-1
HISTSIZE="INFINITE"
HISTFILESIZE="1000000000"
export HISTTIMEFORMAT="[%F %T] "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar
# * matches hidden files (but not . and ..)
shopt -s dotglob

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    txtblk='\[\033[0;30m\]' # Black - Regular
    txtred='\[\033[0;31m\]' # Red
    txtgrn='\[\033[0;32m\]' # Green
    txtylw='\[\033[0;33m\]' # Yellow
    txtblu='\[\033[0;34m\]' # Blue
    txtpur='\[\033[0;35m\]' # Purple
    txtcyn='\[\033[0;36m\]' # Cyan
    txtwht='\[\033[0;37m\]' # White
    bldblk='\[\033[1;30m\]' # Black - Bold
    bldred='\[\033[1;31m\]' # Red
    bldgrn='\[\033[1;32m\]' # Green
    bldylw='\[\033[1;33m\]' # Yellow
    bldblu='\[\033[1;34m\]' # Blue
    bldpur='\[\033[1;35m\]' # Purple
    bldcyn='\[\033[1;36m\]' # Cyan
    bldwht='\[\033[1;37m\]' # White
    unkblk='\[\033[4;30m\]' # Black - Underline
    undred='\[\033[4;31m\]' # Red
    undgrn='\[\033[4;32m\]' # Green
    undylw='\[\033[4;33m\]' # Yellow
    undblu='\[\033[4;34m\]' # Blue
    undpur='\[\033[4;35m\]' # Purple
    undcyn='\[\033[4;36m\]' # Cyan
    undwht='\[\033[4;37m\]' # White
    bakblk='\[\033[40m\]'   # Black - Background
    bakred='\[\033[41m\]'   # Red
    bakgrn='\[\033[42m\]'   # Green
    bakylw='\[\033[43m\]'   # Yellow
    bakblu='\[\033[44m\]'   # Blue
    bakpur='\[\033[45m\]'   # Purple
    bakcyn='\[\033[46m\]'   # Cyan
    bakwht='\[\033[47m\]'   # White
    txtrst='\[\033[0m\]'    # Text Reset
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    # PS1='${debian_chroot:+($debian_chroot)}${bldgrn}\u@\h${txtrst}:${bldblu}\w${txtrst}\$ '
    # PS1="${debian_chroot:+($debian_chroot)}${bldgrn}\u@\h${txtpur}:\w\$(if (( \$? ));then echo \"${txtred}\";else echo \"${txtgrn}\";fi) \$ ${txtrst}" # arethusa
    # PS1="${debian_chroot:+($debian_chroot)}${bldred}\u@\h${txtpur}:\w\$(if (( \$? ));then echo \"${txtred}\";else echo \"${txtgrn}\";fi) \$ ${txtrst}" # arethusa root
    # PS1="${debian_chroot:+($debian_chroot)}${bldgrn}\u@\h${bldblu}:\w\$(if (( \$? ));then echo \"${txtred}\";else echo \"${txtgrn}\";fi) \$ ${txtrst}" # atropos
    # PS1="${debian_chroot:+($debian_chroot)}${bldred}\u@\h${bldblu}:\w\$(if (( \$? ));then echo \"${txtred}\";else echo \"${txtgrn}\";fi) \$ ${txtrst}" # atropos root
	  source ~/.bash_git-prompt.sh
	  PS1='[\W$(__git_ps1 " (%s)")]\$ '
	if (( $(id -u) == 0 )); then
      PS1="${debian_chroot:+($debian_chroot)}${bldred}\u@\h${bldblu}:\w${txtylw}\$(__git_ps1 ' (%s)')\$(if (( \$? ));then echo \"${txtred}\";else echo \"${txtgrn}\";fi) \$ ${txtrst}" # root + git prompt
	else
      PS1="${debian_chroot:+($debian_chroot)}${bldgrn}\u@\h${bldblu}:\w${txtylw}\$(__git_ps1 ' (%s)')\$(if (( \$? ));then echo \"${txtred}\";else echo \"${txtgrn}\";fi) \$ ${txtrst}" # regular + git prompt
	fi
	  export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
    unset txtblk txtred txtgrn txtylw txtblu txtpur txtcyn txtwht
    unset bldblk bldred bldgrn bldylw bldblu bldpur bldcyn bldwht
    unset unkblk undred undgrn undylw undblu undpur undcyn undwht
    unset bakblk bakred bakgrn bakylw bakblu bakpur bakcyn bakwht
    unset txtrst
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -ahlF'
alias ll='ls -ahl'
alias lr='ls -hartl'
alias la='ls -A'
alias l='ls -CF'
alias cd..="cd .."
alias du="du -h"
alias df="df -h"
alias dmesg="dmesg -T"
alias sqlite="sqlite3"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ "$TERM" == "xterm" ]; then
    # No it isn't, it's gnome-terminal
    export TERM=xterm-256color
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi


export EDITOR=nano

eval "$(fasd --init auto)"
