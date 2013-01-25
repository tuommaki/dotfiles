############################################################
# .kshrc - for ksh93

set -o emacs

function _git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return ""
  print "("${ref#refs/heads/}")"
}

function _pwd {
  typeset dir="${PWD:-$(pwd -L)}"

  dir="${dir#$HOME/}"
  if [ "$dir" = "$HOME" ]; then
    print "~"
  else
    print "~/$dir"
  fi
}

function PS1.get {
  .sh.value="[00;36m[$(date +%R)][0m [00;32m$(_git_branch)[0m [00;37m$(_pwd)%[0m "
  return 0
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

