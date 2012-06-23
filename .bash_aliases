alias l='ls -halF'
alias vim='vim -p'
alias p="ps axo pid,user,ucmd,cmd"
alias grep="grep --color=always --line-number"
alias xg="xargs grep --color=always --line-number"
alias less="less -r"



# show git branch in command prompt
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local      NORMAL="\[\033[0;38m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

#PS1="${TITLEBAR}\
#$BLUE[$RED\$(date +%H:%M)$BLUE]\
#$BLUE[$RED\u@\h:\w$GREEN\$(parse_git_branch)$BLUE]\
#$GREEN\$ "

PS1="${TITLEBAR}\
$NORLAM\u@\h:\w$GREEN \$(parse_git_branch)\
$NORMAL\$ "

PS2='> '
PS4='+ '
}
proml

