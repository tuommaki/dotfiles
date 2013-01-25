###############################################
# .profile

PATH=/sbin:/bin/usr/sbin:/usr/bin:$HOME/bin

export BLOCKSIZE=K
export MAIL
export EDITOR=/usr/bin/vim
export VISUAL=$EDITOR
export TERMINAL=/usr/bin/urxvt256c-ml
export EMAIL=tuomas.makinen@<domain>
export PAGER=less
export CDPATH=.:$HOME:$HOME/work
export PAPERSIZE=A4
export HISTSIZE=8192


# ksh93 will look for ~/.kshrc for interactive shell if ENV is not
# set. Set it only for the other shells.
if [ ${SHELL##*/} != ksh ]; then
  export ENV=$HOME/.kshrc
fi
