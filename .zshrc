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
fi

# Aliases
alias -r ll="ls -la"

alias -r checkstyle622="java -jar /mnt/SDXC/School/Georgia\ Tech/Gatech/2\ Sophmore\ 2nd\ Sem/CS\ 1331/checkstyle/checkstyle-6.2.2.jar"

gatech="/mnt/SDXC/School/Georgia\ Tech/Gatech/2\ Sophmore\ 2nd\ Sem"
alias -r gatech="cd $gatech"

# Personal bin
export PATH=~/bin:$PATH

# change some dircolors
eval "$(dircolors ~/.dircolors)";

# Fish-like syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path]='none'
# Removes underline in sudo
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
