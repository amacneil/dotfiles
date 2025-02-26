# general
bindkey -e
export EDITOR=vim
export CLICOLOR=1

# fix for tilix on gnome
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    . /etc/profile.d/vte-2.91.sh
fi

# git prompt
. "${0:a:h}/git-prompt.sh"
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
precmd () { __git_ps1 "%~ " "$ " "(%s)" }

# git helpers
alias gst='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gup='git pull --rebase'
alias gp='git push'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gco='git checkout'
alias gcm='git checkout main || git checkout master'
alias gcd='git checkout develop'
alias glg='git log --stat --max-count=10'
alias glgg='git log --graph --max-count=10'
alias glo='git log --oneline --decorate --color'
alias glog='git log --oneline --decorate --color --graph'
alias ga='git add'
alias yolopr='gh pr create && gh pr merge --squash --auto'

# more helpers
alias yt-m4a='yt-dlp --format "ba[ext=m4a]"'

# go bin
if command -v go > /dev/null; then
  export PATH="$PATH:$(go env GOPATH)/bin"
fi

# tmux+ssh helper function with iterm integration
function tmssh () {
  if [[ -z "$1" ]]; then
    me="${FUNCNAME[0]}${funcstack[1]}"
    echo "usage: $me [ssh-args] hostname"
    return 1
  fi

  ssh "$@" -t 'tmux -CC new -A -s tmssh'
}
