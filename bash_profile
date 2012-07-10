# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export AWS_IAM_HOME=/home/tmak/Applications/IAMCli-1.2.0
export AWS_CREDENTIAL_FILE=/home/tmak/.ec2/aws-credentials

export EC2_HOME=/usr/share/java/ec2-api-tools
export EC2_PRIVATE_KEY=/home/tmak/.ec2/pk-<id>.pem
export EC2_CERT=/home/tmak/.ec2/cert-<id>.pem
export EC2_URL="https://ec2.eu-west-1.amazonaws.com"

export EDITOR=/usr/bin/vim
export EMAIL=tuomas.makinen@<from>.com
export JAVA_HOME=/usr/java/jdk1.6.0_21
export WTK_HOME=/opt/dev/netbeans-7.0rc1/mobility/WTK2.5.2

[ $TERM == "screen" ] && export TERM="screen-256color"

PATH=/home/tmak/.cabal/bin:/home/tmak/Applications/bin:/bin:/sbin:/usr/bin
PATH=$PATH:/usr/sbin:/usr/local/bin:/opt/java/bin:/opt/dev/maven/bin
PATH=$PATH:/opt/dev/ant/bin:$AWS_IAM_HOME/bin

export PATH

