# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
 
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist # Combine multiline commands into one in history
HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoredups # Ignore duplicates, ls without options and builtin commands
export HISTIGNORE="&:ls:[bf]g:exit"
 
shopt -s checkwinsize # check the window size after each command and, if necessary,
 
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# shopt -s globstar
 
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
 
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
 
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
 
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
 
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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
 
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
 
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
 
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
 
 
# Unzip... Extract...
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }
 
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
 
# cat /proc/cpuinfo | grep 'model name' | head -1
# lsb_release -a
# df -h
# free -h
# vmstat -sSM
# cat /proc/meminfo
# uname -r
# cat /proc/version
# sudo do-release-upgrade -d
 
green='\e[0;32m'
NC='\e[0m'
echo -e "${green}Welcome, Gyu-Ho!${NC}"
printf "\n"
free -h
 
export GOPATH=/home/ubuntu/go
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/games:/usr/local/games:/usr/local/go/bin:/home/ubuntu/go/bin
 
alias l='ls -lh'
alias ls="ls --color=auto -F"
alias la='ls -lah'
alias lsp='lsof -P -i -n'
alias ..='cd ..'
alias grep="grep --color=auto"
alias mkdir="mkdir -p"
alias ff="find . | grep "
alias hh="history | grep "
alias pp="ps aux  | grep "
 
alias version='lsb_release -a;'
alias cpu='cat /proc/cpuinfo | grep "model name" | head -1; sensors;'
alias disk='df -h;'
alias memory='free -h;'
 
alias reboot='sudo reboot;'
alias shutdown='sudo telinit 0;'
 
alias ipp='curl icanhazip.com | xclip -selection clipboard;'
 
alias v='vim'
alias t='tmux'
 
alias cleanpkg='cd /home/ubuntu/go/pkg; rm -rf *; cd -;'
alias gotest='go test -v ./...; go test -v -race ./...;'

alias cs='cd /home/ubuntu/go/src;'
alias gh='cd /home/ubuntu/go/src/github.com/gyuho;'
alias learn='cd /home/ubuntu/go/src/github.com/gyuho/learn/doc;'
alias c11='g++ -std=c++11'

