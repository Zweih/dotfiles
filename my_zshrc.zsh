# import this file with `[ -f ~/dotfiles/my_zshrc.zsh ] && source ~/dotfiles/my_zshrc.zsh` in your ~/.zshrc

# Environment variables
[ -f ~/dotfiles/environment_exports.zsh ] && source ~/dotfiles/environment_exports.zsh

# git bash functions
[ -f ~/dotfiles/git_functions.sh ] && source ~/dotfiles/git_functions.sh

source_zshrc() {
  source ~/.zshrc
}

cheat_sheet() {
  [ -f ~/dotfiles/aliases.zsh ] && cat ~/dotfiles/aliases.zsh
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
  echo $(color_text magenta "{")$(color_text red pxy)$(color_text magenta "}")
}

my_date() {
  echo $(color_text green "$(date_am_pm_with_secs)")
}

my_dir() {
  echo $(color_text blue "ᄽ%1~ᄿ")
}

my_prompt_symbol() {
  echo $(color_text magenta "𐂂   ")
}

setopt PROMPT_SUBST

# Load colors
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

my_vcs_info() {
  echo $(color_text red "[")$(color_text magenta ${vcs_info_msg_0_})$(color_text red "] ")
}

PROMPT='$(my_username) $(my_date) $(my_dir) $(my_vcs_info)$(my_prompt_symbol) '
