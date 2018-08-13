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

export gatech=/mnt/SDXC/School/Georgia\ Tech/Gatech/3\ Junior\ 2nd\ Sem
#alias -r gatech="cd $gatech"
#

#cs36=~/Desktop/cs3600
#~cs36

# CS 1332
export CLASSPATH=".:/home/apatel435/Desktop/cs1332/junit/junit-4.12.jar:/home/apatel435/Desktop/cs1332/junit/hamcrest-core-1.3.jar"

alias -r todoist="nw /home/apatel435/vcs/github/kamhix/todoist-linux"

# ls after cd
function cdls() {
    emulate -L zsh
    cd "$@"
    ls -a
}

# Personal bin
export PATH=~/bin:$PATH

## Import colorscheme from wal
#source "$HOME/.cache/wal/colors.sh"
#(wal -r -t &)
# pywal
(cat ~/.cache/wal/sequences &)

# change some dircolors
eval "$(dircolors ~/.dircolors)";

# Fish-like syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path]='none'
# Removes underline in sudo
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
