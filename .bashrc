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
# export PS1='\[\033[0;'${PROMPT_COLOR}'m\][\u:\w]\[\033[0;$('${branch_color}')m\]($('"${showbranch}"'))\n\[\033[0;'${PROMPT_COLOR}'m\]\$ \[\033[0m\]'
#adc_active='adc active 2>/dev/null'
current_k8s_ctx='kubectl config current-context'
default_gcp_project='cat ~/.config/gcloud/configurations/config_default | grep project | cut -d '=' -f 2 | tr -d "[:space:]"'
export PS1='\[\033[0;'${PROMPT_COLOR}'m\][\u:\w]\[\033[0;$('${branch_color}')m\]($('"${showbranch}"'))($('"${default_gcp_project}"'))($('"${current_k8s_ctx}"'))\n\[\033[0;'${PROMPT_COLOR}'m\]\$ \[\033[0m\]'

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
alias k="kubectl"
alias gcessh='gcloud compute ssh --zone $(gcloud compute instances list --format="value(name,zone)" --filter="status=RUNNING" | peco | awk "{print \$2,\$1}")'
alias gcessh-iap='gcloud beta compute ssh --tunnel-through-iap --zone $(gcloud compute instances list --format="value(name,zone)" --filter="status=RUNNING" | peco | awk "{print \$2,\$1}")'
alias kubectx='kubectl config use-context $(kubectl config get-contexts -oname | peco)'
alias pod='kubectl describe pods -n $(kubectl get pods -A -o custom-columns=NAME:.metadata.name,NAMESPACE:.metadata.namespace | peco | awk "{print \$2,\$1}")'
alias gcloudctx='gcloud config set core/project $(gcloud projects list --format="value(project_id)" | peco)'
alias gauth='gcloud config set account $(gcloud auth list --format="value(account)" | peco) && gcloud auth list'
alias goland='open -a Goland .'
# alias e="emacsclient -t"
# alias kill-emacs="emacsclient -e '(kill-emacs)'"
function cdls() {
    \cd "$1"
    ls
}
alias cd=cdls

function godoc_with_peco() {
    \go doc -all `list_go_pkg | peco` | less
}
alias gd=godoc_with_peco

function golook() {
    \godoc -src `list_go_pkg | peco` | vim -R - -c 'set ft=go'
}
alias golook=golook

export LC_ALL=en_US.UTF-8

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
if [ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash ] ; then
    . /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH=$PATH:/usr/local/bin

# Homebrew
export PATH=$HOME/homebrew/bin:$PATH
export LD_LIBRARY_PATH=$HOME/homebrew/lib:$LD_LIBRARY_PATH

# dircolors (cf. https://qiita.com/y_310/items/101ef023124072b9c73f)
export PATH=$HOME/homebrew/opt/coreutils/libexec/gnubin:$PATH

# go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# maven
export PATH=$PATH:$HOME/lib/apache-maven-3.6.0/bin

# pear
export PATH=$PATH:$HOME/pear/bin

# jenv
eval "$(jenv init -)"

# personal bin
export PATH=$HOME/bin:$PATH

# use java8
export JAVA_HOME=`/usr/libexec/java_home -v "1.8"`
## If Java11 is needed, remove following comment.
# export JAVA_HOME=`/usr/libexec/java_home -v "11"`
export PATH=${JAVA_HOME}/bin:${PATH}

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# pyenv
eval "$(pyenv init -)"

# aws
export PATH=$HOME/aws-cli:${PATH}
