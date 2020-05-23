# shared config
. "${0:a:h}/profile"

# git prompt
. "${0:a:h}/git-prompt.sh"
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
precmd () { __git_ps1 "%~ " "$ " "(%s)" }
