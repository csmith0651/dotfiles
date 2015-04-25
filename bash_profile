echo "entering .bash_profile"

export EC2_HOME=~/.ec2
export SLUG_BUCKET=tj-slugforge
export JENKINS_USERNAME=craig.smith
export JENKINS_TOKEN=74ea2c87c4d26c120da22ba901a0d1e2
export HISTSIZE=2000

# export KNIFE_HOME=~/src/chef
# export PERSONAL_CHEF="your chef hostname here"
# source ~/src/TEM/em.sh
# em init

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

echo "exiting .bash_profile"
