#.bash_profile

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Disable macOS zsh prompt message
export BASH_SILENCE_DEPRECATION_WARNING=1

export PATH="$HOME/.cargo/bin:$PATH"

# added by Anaconda3 5.1.0 installer
export PATH="/anaconda3/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/furuyama/google-cloud-sdk/path.bash.inc' ]; then . '/Users/furuyama/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/furuyama/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/furuyama/google-cloud-sdk/completion.bash.inc'; fi
