# general
export EDITOR=nvim
export CLICOLOR=1

# neovim
alias vi=nvim
alias vim=nvim

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
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias glg='git log --stat --max-count=10'
alias glgg='git log --graph --max-count=10'
alias glo='git log --oneline --decorate --color'
alias glog='git log --oneline --decorate --color --graph'
alias ga='git add'

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
