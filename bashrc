echo "entering .bashrc"

# stupid hack, inject /usr/local/bin at the beginning of the path if started inside emacs
if [ ! -z "$INSIDE_EMACS" ]; then
  case ":$PATH:" in
      *:/usr/local/bin:*) echo "found" ;;
      *) PATH=/usr/local/bin:$PATH ;;
  esac
  export PAGER=cat
fi

source ~/src/TEM/em.sh
em init

if [ -f ~/.mycolors ]; then
  . ~/.mycolors
fi

# succinct way to load file
#test -f ~/.git-prompt.sh && . $_
if [ -f ~/.git-prompt.sh ]; then
   export GIT_PS1_SHOWDIRTYSTATE=true
   . ~/.git-prompt.sh
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#YELLOW="\[\033[0;33m\]"
#NO_COLOR="\[\033[0m\]"
#[[ "$TERM" == dumb ]] && PS1="\n\w\n$ "
#[[ "$TERM" != dumb ]] && PS1="\n\[\e[1;36m\]\w $YELLOW\$(parse_git_branch)$NO_COLOR\n\[\e[1;32m\]$ \    [\e[0m\]"

host=`hostname`
if [ "$host" == "Craigs-MacBook-Pro.local" -o "$host" == "Craigs-MBP" ];
then
  PS1='\W$(__git_ps1 " (%s)")\$ '
else
  PS1="\h:\W \u\$ "
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:~/bin

# Load the default .profil
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

source $HOME/.alias

echo "exiting .bashrc"
