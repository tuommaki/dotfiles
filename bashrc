# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# User specific aliases and functions

function parse_git_branch {
   branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/') || return
   echo "("${branch#refs/heads/}")"
}

# Change keyboard layout between us and finnish
function change_layout() {
   SETXKBMAP_BIN=$(which setxkbmap)
   XMODMAP_BIN=$(which xmodmap)
   #GREP_BIN=$(which grep) # grep's itself an alias - this fucks up if used..
   GREP_BIN=grep
   AWK_BIN=$(which awk)

   cur_layout=$($SETXKBMAP_BIN -print | $GREP_BIN "xkb_symbols" | $AWK_BIN '{ print $4 }' | $AWK_BIN -F"+" '{print $2}')

   if [ "$cur_layout" != "us" ]; then
      $SETXKBMAP_BIN -layout us
   else
      $SETXKBMAP_BIN -layout fi
   fi

   $XMODMAP_BIN ~/.Xmodmap
}



RED="\[\033[0;31m\]"
BLUE="\[\033[1;34m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[1;32m\]"
RST="\[\e[0m\]"

PS1="$GREEN\$(date +%H:%M)$RST $RED[\h]$YELLOW (\w)$GREEN\$ $RST"

# Less colors for Man pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

alias man='man -P less'
alias repos='cd ~/Work/repositories'
