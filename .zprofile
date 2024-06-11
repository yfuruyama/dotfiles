if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi

# prompt
PROMPT_COLOR=32 # green
BRANCH_NO_DIFF_COLOR=32 # green
BRANCH_DIFF_COLOR=31 # red
showbranch='git rev-parse --abbrev-ref HEAD 2>/dev/null'
function branch_color() {
    if [ `git status --short 2>/dev/null | wc -l` -eq 0 ] ; then
        echo $BRANCH_NO_DIFF_COLOR
    else
        echo $BRANCH_DIFF_COLOR
    fi
}
branch_color='branch_color'
export PS1='\[\033[0;'${PROMPT_COLOR}'m\][\u:\w]\[\033[0;$('${branch_color}')m\]($('"${showbranch}"'))\n\[\033[0;'${PROMPT_COLOR}'m\]\$ \[\033[0m\]'

# color settings for ls command
alias dircolors="/opt/homebrew/opt/coreutils/libexec/gnubin/dircolors"
if [ -f ~/.dir_colors ]; then
    # for Linux
    eval `dircolors ~/.dir_colors`
fi
# for Mac OS
export LSCOLORS=gxfxcxdxbxegedabagacad

export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '
export LC_ALL=en_US.UTF-8
export PAGER='less -R'

# some useful alias
if ls --color >/dev/null 2>&1 ; then
    # for Linux
    alias ls="ls -Fh --color"
else
    # for Mac OS
    alias ls="ls -GFh"
fi
alias ll="ls -l"
alias la="ls -a"
alias mv="mv -i"
alias cp="cp -i"
alias less="less -i"
alias u="cd ../"
alias uu="cd ../../"
alias uuu="cd ../../../"
alias uuuu="cd ../../../../"
alias uuuuu="cd ../../../../../"
alias hl="highlight"
alias grep="grep --color=auto"
alias tree="tree -C"
alias diff="git diff --no-index"
alias view="vim -R"
alias telnet="rlwrap telnet"
alias nc="rlwrap nc"
alias r='cd $(ghq list --full-path | peco)'
alias tmux='tmux -u'
alias k="kubectl"
alias kubectx='kubectl config use-context $(kubectl config get-contexts -oname | peco)'
function cdls() {
    \cd "$1"
    ls
}
alias cd=cdls

# disable some key mapping of terminal
# cf. $ stty -a
stty start undef # Ctrl-Q
stty stop undef  # Ctrl-S
stty -ixon -ixoff

export PYTHONSTARTUP=$HOME/.pythonstartup
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/bin
eval "$(/opt/homebrew/bin/brew shellenv)"
