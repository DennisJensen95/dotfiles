eval "$(starship init zsh)"

alias cat=bat

export PYENV_ROOT=~/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Hook direnv into shell
eval "$(direnv hook zsh)"

# Load Angular CLI autocompletion.
source <(ng completion script)

alias ls="eza -la"

open_git_origin() {
    # Get the URL of the 'origin' remote repository
    local url=$(git remote get-url origin)

    # Check if the URL is a valid HTTP/HTTPS URL
    if [[ $url =~ ^http ]]; then
        open $url
    else
        # If the URL is in SSH format (like git@github.com:username/repo.git),
        # convert it to HTTP format
        url=$(echo "$url" | sed -E 's/git@([^:]+):/https:\/\/\1\//')

        # Open the converted URL
        open "$url"
    fi
}

open_github_actions() {
    local url=$(git remote get-url origin)
    if [[ $url =~ ^http ]]; then
        open $url/actions
    else
        # If the URL is in SSH format (like git@github.com:username/repo.git),
        # convert it to HTTP format
    url=$(echo "$url" | sed -E 's/git@([^:]+):/https:\/\/\1\//' | sed 's/\.git$//')

        # Open the converted URL
        open "$url/actions"
    fi
}

alias co="gh copilot suggest $@"
