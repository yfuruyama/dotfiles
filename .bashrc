#########
#.bashrc
#########

# Mac OS terminal font: Andale Mono 13 pt.

if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi

# python
export PYTHONSTARTUP=$HOME/.pythonstartup

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
if [ -f ~/.dir_colors ]; then
    # for Linux
    eval `dircolors ~/.dir_colors -b`
else
    # for Mac OS
    export LSCOLORS=gxfxcxdxbxegedabagacad
fi

export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

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
alias ce="carton exec --"
alias grep="grep --color=auto"
alias tree="tree -C"
alias diff="git diff --no-index"
alias view="vim -R"
alias telnet="rlwrap telnet"
alias nc="rlwrap nc"
alias r='cd $(ghq list --full-path | peco)'
alias tmux='tmux -u'
alias ctags='ctags -R --exclude=node_modules --exclude=build'
alias pullreq='hub pull-request'
alias rlog='cat $HOME/.tailer.rc | peco | bash -'
alias puml='java -jar /usr/local/bin/plantuml.jar'
alias gcloud_project="gcloud config list --format 'value(core.project)'"
# alias e="emacsclient -t"
# alias kill-emacs="emacsclient -e '(kill-emacs)'"
function cdls() {
    \cd "$1"
    ls
}
alias cd=cdls

function godoc_with_peco() {
    \godoc `list_go_pkg | peco` | less
}
alias gd=godoc_with_peco

function golook() {
    \godoc -src `list_go_pkg | peco` | vim -R - -c 'set ft=go'
}
alias golook=golook

# export LANG=ja_JP.UTF-8

function pmlook() {
    PERL5LIB=local/lib/perl5 \perldoc -m -T $@ | vim -R - -c 'set ft=perl'
}
alias pmlook=pmlook

export PATH=$HOME/.nodebrew/current/bin:$PATH

# disable some key mapping of terminal
# cf. $ stty -a
stty start undef # Ctrl-Q
stty stop undef  # Ctrl-S
stty -ixon -ixoff

# basictex
export PATH=/usr/texbin:"$PATH"

# Android
alias android23='emulator -avd AVD_for_Nexus_One_by_Google'
if [ -f $HOME/.git-completion.bash ] ; then
    . ~/.git-completion.bash
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

PATH=$PATH:/usr/local/bin
export PATH
alias chrome_nexus='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --user-agent="Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.122 Mobile Safari/537.36" --user-data-dir=/tmp/nexus4chrome';
