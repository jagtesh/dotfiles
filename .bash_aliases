#  Customize BASH PS1 prompt to show current GIT repository and branch.
#  by Mike Stewart - http://MediaDoneRight.com

#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
#  I don't remember where I found this.  o_O

OS=$(uname -s)

if [[ $OS == 'Darwin' ]]; then
  BrewDir='/usr/local'
else
  BrewDir='$HOME/.linuxbrew'
fi

if [[ -z "$(type -t __git_ps1)" ]]; then 
  source $HOME/Repos/dotfiles/git-prompt.sh
fi

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"


# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better

DisplayPath=" $BWhite$PathShort"

export PS1=$IBlack$Time12a$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$DisplayPath$Green'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$DisplayPath$IRed'"$(__git_ps1 " {%s}"); \
  fi) '$Color_Off$NewLine'\$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo "'$DisplayPath$Color_Off$NewLine'\$ "; \
fi)'


#####################################################################
# Other customizations, eg. setting the PATH etc.
#####################################################################
export PATH="$BrewDir/bin:$PATH"
export MANPATH="$BrewDir/share/man:$MANPATH"
export INFOPATH="$BrewDir/share/info:$INFOPATH"
#if [[ $OS == 'Darwin' ]]; then
#  export TERM='xterm-256color'
#else
#  export TERM='screen-256color'
#fi
export EDITOR='nano'
export GIT_EDITOR=$EDITOR
export VISUAL=$EDITOR
if [[ $OS != 'Darwin' ]]; then
#  export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
  export SSL_CERT_FILE='/usr/local/etc/openssl/cert.pem'
fi
export PATH="$PATH:$HOME/.rvm/bin:$HOME/.npm/bin" # Add RVM to PATH for scripting
if [[ $OS == 'Darwin' ]]; then
  PATH="$PATH:/Users/jagtesh/Repos/Nim/bin"
fi

export GOPATH=~/gocode/
export PATH=$PATH:$GOPATH/bin

#export PATH=$PATH:~/.nimble/bin
#export PATH=$PATH:/usr/local/share/gradle-1.11/bin:/usr/local/share/apache-ant-1.9.4/bin
#export GRADLE_HOME=/usr/local/share/gradle-1.11
#export JAVA_OPTS='-Xmx2048m -Xss1024k -XX:MaxPermSize=256m'
#export ANT_OPTS='-Xmx1024m -Xms512m'

# Set the ssh-agent; need this for accessing keys across tunnels
#if [[ $OS != 'Darwin' ]]; then
  eval `keychain --eval id_rsa`
#fi

alias rex='rbenv exec'
alias g='git'
alias ga='git add'
alias grm='git rm'
alias gre='git reset'
alias gc='git commit'
alias gco='git checkout'
alias gcm='git commit -m'
alias gs='git status'
alias gl='git log'
alias glf='git log --all --graph --decorate --oneline --simplify-by-decoration'
alias gpl='git pull'
alias gps='git push'

# Enable syntax colouring on Darwin
if [[ $OS == 'Darwin' ]]; then
  alias ls='ls -G'
  #export PATH=/usr/local/Cellar/openssl/1.0.2d_1/bin:$PATH
fi

#eval $(docker-machine env default)
#eval $(dinghy shellinit)
#KUBERNETES_PROVIDER=vagrant

# NVM stuff
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# For proper SymPy support
export PYTHONIOENCODING=utf-8

# For nvim
# Fix the Ctrl-H code in terminfo
if [[ ! -e ~/.tic/$TERM.ti ]]; then
  mkdir -p ~/.tic
  infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > ~/.tic/$TERM.ti
  tic ~/.tic/$TERM.ti
fi
