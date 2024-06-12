
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/furuyama/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/furuyama/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/furuyama/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/furuyama/google-cloud-sdk/completion.zsh.inc'; fi

export PROMPT='%F{green}[%n:%~]%f '
