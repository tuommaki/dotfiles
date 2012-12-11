
if [ -f ~/.zsh.completionrc ]; then
    source ~/.zsh.completionrc
fi

HISTFILE=~/.zhistory
HISTSIZE=8192
SAVEHIST=8192
setopt autocd extendedglob
bindkey -e
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "^H" backward-delete-word
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey '^i' expand-or-complete-prefix
bindkey '^R' history-incremental-search-backward


PROMPT='%{%F{cyan}%}[%T] %{%F{red}%}%m%{%F{white}%}> %{%f%}'
RPROMPT='%{%F{green}%}%~%{%f%}'

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

function gitdiff() {
  git diff --no-ext-diff -w "$@" | vim -R -
}

export EDITOR=/usr/bin/vim
export TERMINAL=/usr/bin/urxvt256c-ml
export EMAIL=tuomas.makinen@<domain>
export AWT_TOOLKIT=XToolkit

[ $TERM=="xterm" ] && export TERM="xterm-256color"

#[ $TERM=="screen" ] && export TERM="screen-256color"

PATH=/home/tmak/.cabal/bin:/home/tmak/Applications/bin:/bin:/sbin:/usr/bin
PATH=$PATH:/usr/sbin:/usr/local/bin:/opt/java/bin:/opt/dev/maven/bin
PATH=$PATH:/home/tmak/Applications/node/bin

export LD_LIBRARY_PATH=/home/tmak/Applications/lib
export NODE_PATH=/home/tmak/Applications/node/lib/node_modules

export PATH

alias pip=pip-python

