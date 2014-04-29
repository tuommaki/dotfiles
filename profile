# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
export PATH HOME TERM

function exitstatus {
  retval=$?
  test $retval -gt 0 && printf "[1;41m$retval[00m"
}

PS1='$(exitstatus)[36m\A|\h[00m|[93m\w[00m $ '

HISTFILE="$HOME/.pdksh.history"
HISTSIZE=32768

# Use Stockholm's mirror for pkgs
export PKG_PATH=http://ftp.eu.openbsd.org/pub/OpenBSD/5.4/packages/`machine -a`/

# Bind Ctrl+L to clear the screen
bind -m '^L'=clear'^J'
