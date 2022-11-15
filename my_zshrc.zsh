eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# work aliases
[ -f ~/work_dotfiles/aliases.zsh ] && source ~/work_dotfiles/aliases.zsh

# git functions
fetch_origin_and_pull() {
  git fetch origin $(git rev-parse --abbrev-ref HEAD) && git pull
}

get_main_or_master() {
  awk -F "/" '{print $NF}' .git/refs/remotes/origin/HEAD
}

checkout_main_or_master() {
  git checkout $(get_main_or_master)
}

create_branch_and_checkout() {
  git checkout -b $1
}

checkout_previous_branch() {
  git checkout -
}

# git aliases
alias fop="fetch_origin_and_pull"
alias mainster="get_main_or_master"
alias cmm="checkout_main_or_master"
alias cbc="create_branch_and_checkout"
alias cpb="checkout_previous_branch"

# GOPATH aliases
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin

date_am_pm_with_secs() {
  date +'%r'
}

color_text () {
  echo "%{$fg[$1]%}$2%{$reset_color%}"
}

my_username () {
  echo $(color_text red "[pxy]")
}

my_date() {
  echo $(color_text green $(date_am_pm_with_secs))
}

my_dir() {
  echo $(color_text blue "[%1~]")
}

setopt PROMPT_SUBST

# Load colors
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b '

my_vcs_info() {
  echo $(color_text magenta ${vcs_info_msg_0_})
}

PROMPT='$(my_username) $(my_date) $(my_dir) $(my_vcs_info)~> '

