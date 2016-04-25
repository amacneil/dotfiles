export EDITOR=vim
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin
export GETHDEV_OPTS='--datadir /tmp/gethdev --ipcpath ~/Library/Ethereum/geth.ipc'

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# git prompt
source ~/.git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\h:\w" "\\\$ "'
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true

# neovim
alias vi='nvim'
alias vim='nvim'

# docker
alias dk='docker'
alias dkc='docker-compose'
alias dm='docker-machine start default; eval "$(docker-machine env default)"'
alias dmr='docker-machine stop default && dm'
eval "$(docker-machine env default 2> /dev/null)"

# bundler
alias b='bundle'
alias be='bundle exec'
alias bo='bundle open'

# git aliases stolen from oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh
alias g='git'
alias gst='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gl='git pull'
alias gup='git pull --rebase'
alias gp='git push'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gco='git checkout'
alias gcm='git checkout master'
alias gb='git branch'
alias gba='git branch -a'
alias gbr='git branch --remote'
alias glg='git log --stat --max-count=10'
alias glgg='git log --graph --max-count=10'
alias glo='git log --oneline --decorate --color'
alias glog='git log --oneline --decorate --color --graph'
alias ga='git add'
