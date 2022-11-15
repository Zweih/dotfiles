# Initialize homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# export Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GOPATH aliases
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin
