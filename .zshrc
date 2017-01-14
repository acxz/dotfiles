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

# Aliases
alias -r ll="ls -la"

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
