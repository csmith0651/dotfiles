#
# INVOKED: login
#

echo "entering .bash_profile"

export EC2_HOME=~/.ec2
export SLUG_BUCKET=tj-slugforge
export HISTSIZE=2000
export CDPATH=$CDPATH:~/src:~
export CDPATH=.  # ALWAYS start searching from the current directory

# export KNIFE_HOME=~/src/chef
# export PERSONAL_CHEF="your chef hostname here"
# source ~/src/TEM/em.sh
# em init

#if [ -f ~/.bash_profile_secret ]; then
#   source ~/.bash_profile_secret
#fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

echo "exiting .bash_profile"
