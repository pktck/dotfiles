alias l='ls -halF'
alias vim='vim -p'
alias p="ps axo pid,user,ucmd,cmd"
alias grep="grep --color=always --line-number"
#alias xg="xargs grep --color=always --line-number"
alias less="less -r"
alias c="~/scripts/vimcat"

# show git branch in command prompt
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function set_tmux_status_right {
    BASEDIR=`git rev-parse --show-toplevel 2>/dev/null | sed "s/.*\\///"`
    #$(tmux set status-right "`parse_git_branch`")
    $(tmux set status-right "#[fg=blue]#S #[fg=green] $BASEDIR `parse_git_branch` #[fg=white]%H:%M %m-%d")
}

function findgrep {
    name=$1
    query=$2

    echo name:"$name"
    echo query:$query

    find . -name "$name" | xargs grep --color=always --line-number "$query"
}

# fucking globs
reset_expansion(){ CMD="$1"; shift; $CMD "$@"; set +f; }
alias f='set -f; reset_expansion findgrep'

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

    PS1="\$(set_tmux_status_right)\
${TITLEBAR}\
$NORLAM\u@\h:\w$GREEN \$(parse_git_branch)\
$NORMAL\$ "

    PS2='> '
    PS4='+ '
}
proml

