
# git functions
get_current_branch() {
  git branch | grep \* | cut -d ' ' -f2
}

push_current_branch() {
  git push origin $(get_current_branch)
}

fetch_origin_and_pull() {
  git fetch origin $(git rev-parse --abbrev-ref HEAD) && git pull
}

get_main_or_master() {
  awk -F "/" '{print $NF}' .git/refs/remotes/origin/HEAD
}

merge_main_or_master() {
  git merge $(get_main_or_master)
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

commit_with_message() {
  git commit -m "$1"
}

add_all_files() {
  git add .
}
