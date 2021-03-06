#
# INVOKED: login
#

echo "entering .bash_profile"

# for tjsh
export TARGET_URL=http://craigs-tapinabox.tapjoy.net

export EC2_HOME=~/.ec2
export SLUG_BUCKET=tj-slugforge
export HISTSIZE=2000
export CDPATH=$CDPATH:~/src:~
export CDPATH=.  # ALWAYS start searching from the current directory

ulimit -n 65536
ulimit -u 2048

# export KNIFE_HOME=~/src/chef
# export PERSONAL_CHEF="your chef hostname here"
# source ~/src/TEM/em.sh
# em init

export TEST_KITCHEN_KEY=ops-qa-keypair
export TEST_KITCHEN_KEY_PATH=/Users/craigsmith/.ssh/ops-qa-keypair.pem

#if [ -f ~/.bash_profile_secret ]; then
#   source ~/.bash_profile_secret
#fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

echo "exiting .bash_profile"
