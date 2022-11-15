# import this file with `[ -f ~/dotfiles/my_zshrc.zsh ] && source ~/dotfiles/my_zshrc.zsh` in your ~/.zshrc

# Environment variables
[ -f ~/dotfiles/environment_exports.zsh ] && source ~/dotfiles/environment_exports.zsh

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

checkout_branch() {
  git checkout $1
}

# aliases
[ -f ~/dotfiles/aliases.zsh ] && source ~/dotfiles/aliases.zsh

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

