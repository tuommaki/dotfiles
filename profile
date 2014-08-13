# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

# Change keyboard layout between us and finnish
function change_layout {
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

function exitstatus {
  retval=$?
  test $retval -gt 0 && printf "[1;41m$retval[00m"
}

PS1='$(exitstatus)[36m\A \h[00m [93m\w[00m $ '

HISTFILE="$HOME/.pdksh.history"
HISTSIZE=32768

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
export PATH HOME TERM

# utf8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Bind Ctrl+L to clear the screen
bind -m '^L'=clear'^J'
