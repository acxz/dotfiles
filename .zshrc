# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by copinstall
zstyle :compinstall filename '/home/acxz/.zshrc'

autoload -Uz compinit
compinit
# End of lines add by compinstall

# Custom prompt TODO
# export PS1="\[\033[0;34m\]\w \[\033[33m\]❯❯❱\\[\033[m\] "


# Change tty colors
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P01E2832" #black
    echo -en "\e]P87D7A68" #darkgrey
    echo -en "\e]P1D73737" #red
    echo -en "\e]P9D73737" #red
    echo -en "\e]P260AC39" #green
    echo -en "\e]PA60AC39" #green
    echo -en "\e]P3CFB017" #yellow
    echo -en "\e]PBCFB017" #yellow
    echo -en "\e]P46684E1" #blue
    echo -en "\e]PC6684E1" #blue
    echo -en "\e]P57054D4" #magenta
    echo -en "\e]PD7054D4" #magenta
    echo -en "\e]P61FAD83" #cyan
    echo -en "\e]PE1FAD83" #cyan
    echo -en "\e]P7A6A28C" #lightgrey
    echo -en "\e]PFFEFBEC" #white
    clear #for background artifacting
    setfont ter-124n
fi

# Aliases
alias -r ll="ls -la"
alias -r vim="nvim"
alias -r vi="nvim"

alias -r weather="curl wttr.in"
alias -r moon="curl wttr.in/Moon"

alias -r age="awk -F \"[[ ]\" 'NR==1 {print $2;}' /var/log/pacman.log"

export gatech=/mnt/SDXC/School/Georgia_Tech/Gatech/5_Masters_2nd_Sem
# CS 1332
#export CLASSPATH=".:/home/apatel435/Desktop/cs1332/junit/junit-4.12.jar:/home/apatel435/Desktop/cs1332/junit/hamcrest-core-1.3.jar"

# ls after cd
function cdls() {
    emulate -L zsh
    cd "$@"
    ls -a
}

# Personal bin
export PATH=~/bin:$PATH

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# change some dircolors
eval "$(dircolors ~/.dircolors)";

# Fish-like syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path]='none'
# Removes underline in sudo
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'

# Fish-like autosuggesstions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ROS stuff
stat /opt/ros/noetic/setup.zsh &> /dev/null
if [ $? -eq 0 ]; then
    source /opt/ros/noetic/setup.zsh

    export ROS_MASTER_URI=http://localhost:11311
    export ROS_HOSTNAME=localhost

fi

# turtlebot3 stuff
#export TURTLEBOT3_MODEL=burger

# Gazebo stuff
stat /usr/share/gazebo/setup.sh &> /dev/null
if [ $? -eq 0 ]; then
    source /usr/share/gazebo/setup.sh
    alias killgazebo="killall -9 gazebo & killall -9 gzserver  & killall -9 gzclient"
fi

# Multirotor stuff
## Ardupilot
export ACDS_ARDU_DIR="/home/acxz/vcs/git/github.gatech/ACDS/multirotor/ardupilot"
alias waf="$ACDS_ARDU_DIR/modules/waf/waf-light"
export PATH=$PATH:$ACDS_ARDU_DIR/Tools/autotest # maybe pr upstream on this?
## ROS
# for some reason need to use absolute path
# Use full path instead of relative
export MULTIROTOR_WS="/home/acxz/vcs/git/github.gatech/ACDS/multirotor/multirotor_ws"

stat $MULTIROTOR_WS/devel/setup.zsh &> /dev/null
if [ $? -eq 0 ]; then
    source $MULTIROTOR_WS/devel/setup.zsh
fi

export IGN_IP=127.0.0.1 # wat is this used for?
export GAZEBO_MODEL_PATH=$MULTIROTOR_WS/src/acds_multirotor/sitl/models:${GAZEBO_MODEL_PATH}

# Crazyflie stuff
#source ~/cf_ws/devel/setup.zsh
