# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by copinstall
zstyle :compinstall filename '/home/apatel435/.zshrc'

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

alias -r weather="curl wttr.in"
alias -r moon="curl wttr.in/Moon"

export gatech=/mnt/SDXC/School/Georgia_Tech/Gatech/5_Masters_1st_Sem
# CS 1332
export CLASSPATH=".:/home/apatel435/Desktop/cs1332/junit/junit-4.12.jar:/home/apatel435/Desktop/cs1332/junit/hamcrest-core-1.3.jar"

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

# ROS stuff
stat /opt/ros/melodic/setup.zsh &> /dev/null
if [ $? -eq 0 ]; then
    source /opt/ros/melodic/setup.zsh

    export ROS_MASTER_URI=http://143.215.48.230:11311
    export ROS_HOSTNAME=143.215.48.230

    # turtlebot3 stuff
    export TURTLEBOT3_MODEL=burger
fi
