#.bash_profile

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH="$HOME/.cargo/bin:$PATH"

# added by Anaconda3 5.1.0 installer
export PATH="/anaconda3/bin:$PATH"
