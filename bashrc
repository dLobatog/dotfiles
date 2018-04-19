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
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

# Git aliases
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gcp='git cherry-pick'
alias git-last-commit="git log | head -1 | cut -d ' ' -f2 | xclip -selection clipboard"
alias glc="git-last-commit"
alias grc="git rebase --continue"
alias grs="git rebase --skip"
alias gpud="gpu --rebase upstream develop"
alias gpum="gpu --rebase upstream master"

# Other tool aliases
alias v="vim"
alias c="cat"
alias r="rake"
alias z="zeus"
alias sp="bin/spring"
alias sml="rlwrap sml"
alias ocaml="rlwrap ocaml"
alias mit-scheme="rlwrap mit-scheme-x86-64"
alias clojure_repl='lein repl'

# Load clojure
export CLASSPATH=/home/daniel/.clojure/clojure.jar

# Vim color support
TERM=xterm-256color
#set t_Co=256
# but change it to screen-256color if in tmux
[ -n "$TMUX" ] && export TERM=screen-256color

PORT=5000 # Setting the env variable for flask/django

export PERL_LOCAL_LIB_ROOT="/home/daniel/perl5";
export PERL_MB_OPT="--install_base /home/daniel/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/daniel/perl5";
export PERL5LIB="/home/daniel/perl5/lib/perl5/x86_64-linux-gnu-thread-multi:/home/daniel/perl5/lib/perl5";
export PATH="/home/daniel/perl5/bin:$PATH";
export PATH="/home/daniel/.bin:$PATH";

# Colored bash prompt user::hostname { directory } ->
PS1='\[\033[01;32m\]\u\[\033[01;34m\]::\[\033[01;31m\]\h \[\033[00;34m\]{ \[\033[01;34m\]\w \[\033[00;34m\]}\[\033[01;32m\]-> \[\033[00m\]'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Navigate up a directory using dots
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

export GPGKEY=38D6DE30

# Leiningen
PATH=$PATH:$HOME/.lein/bin

# Wrap hub
eval "$(hub alias -s)"

# Lenovo server
alias toshiba="ssh daniel@toshibalobato.myddns.me"
alias redhat-computing="ssh dlobatog@file.mad.redhat.com"

# Rails aliases
alias rp="rails server Puma"
alias rs="rails server"
alias rc="rails console"
alias rt="rake test"
alias bu="bundle update"
alias bi="bundle install"

# NPM alias
alias ni="npm install"

export VAGRANT_DEFAULT_PROVIDER=libvirt
# Vagrant home in the external HD
#export VAGRANT_HOME=/run/media/daniel/Lobato-ext/vagrant_home
. ~/.bashrc_vagrant.sh
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/daniel/workspace/etcd-v0.4.6-linux-amd64
export EDITOR='vim'

# Promptline vim
source ~/.shell_prompt.sh
# Disable GNOME asking for ssh credentials
unset SSH_ASKPASS

# Add rust LD library to path
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

# Google Calendar CLI aliases
alias gcal=gcalcli

# Default build clojurescript
alias cljs-build="java -cp cljs.jar:src clojure.main"

# default uri for virsh commands
export LIBVIRT_DEFAULT_URI=qemu:///system

# Weather aliases
alias weather="curl -4 wttr.in/Madrid"

alias srg="sr google"

export SURFRAW_graphical=no
export SURFRAW_text_browser=/usr/bin/links

alias wpd='./node_modules/.bin/webpack-dev-server --config config/webpack.config.js'
alias be='bundle exec'
# Check C code matches linux kernel standard
alias lcp='~/workspace/linux/scripts/checkpatch.pl --terse -f'
alias wp='./node_modules/.bin/webpack-dev-server --config config/webpack.config.js $WEBPACK_OPTS'
alias mutt='neomutt'

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
# because usually the rest of the OS is in jp_JP and some errors are quite cryptic
#export LANG="ja_JP.UTF-8"
alias satlab="ssh root@mandy-rheaves.sat.lab.tlv.redhat.com"
source ~/.rbenv/completions/rbenv.bash

export FOREMAN_URL=https://centos7-devel.lobatolan.home
export FOREMAN_SSL_CERT=/home/dlobatog/workspace/ansible-demo/katello-default-ca.crt
export FOREMAN_SSL_KEY=/home/dlobatog/workspace/ansible-demo/katello-default-ca.key
export FOREMAN_SSL_VERIFY=False

# Make bash history longer
shopt -s histappend
shopt -s cmdhist
export HISTFILESIZE=1000000
export HISTSIZE=100000
export HISTCONTROL=ignoreboth
export HISTIGNORE='history'

# added by Anaconda3 4.4.0 installer
export PATH="/home/dlobatog/.anaconda3/bin:$PATH"
#source ~/.aws-alias.sh
#source ~/workspace/nvm/nvm.sh
