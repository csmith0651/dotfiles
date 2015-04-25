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

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# YELLOW="\[\033[0;33m\]"
# NO_COLOR="\[\033[0m\]"
# [[ "$TERM" == dumb ]] && PS1="\n\w\n$ "
# [[ "$TERM" != dumb ]] && PS1="\n\[\e[1;36m\]\w $YELLOW\$(parse_git_branch)$NO_COLOR\n\[\e[1;32m\]$ \    [\e[0m\]"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Load the default .profil
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

source $HOME/.alias

echo "exiting .bashrc"
