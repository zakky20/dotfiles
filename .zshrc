# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-completions zsh-autosuggestions fast-syntax-highlighting)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit
source "$ZSH/oh-my-zsh.sh"

# Export Colors, Editor, Man & Vim in term
export PATH="$HOME/.cargo/bin:$PATH"
export TERMINAL="alacritty"
export BROWSER="firefox"
export TERM="xterm-256color"
export EDITOR="nvim"

# Settings
setopt PROMPT_SUBST
setopt autocd
setopt interactive_comments
autoload -U compinit
autoload -U colors && colors	

# Color Script
colorscript random

# Prompt 
# PS1='%F{green}%n@%m%f %F{cyan}%~%f %F{white}$%f '

# Path For .config
if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

# Path For .cache
if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

# Path For .emacs.d
if [ -d "$HOME/.emacs.d/bin" ] ;
  then PATH="$HOME/.emacs.d/bin:$PATH"
fi

# Path For Emacs
if [ -d "$HOME/.config/emacs/bin/" ] ;
  then PATH="$HOME/.config/emacs/bin/:$PATH"
fi

# Countdown
cdown () {
    N=$1
  while [[ $((--N)) -gt  0 ]]
    do
        echo "$N" |  figlet -c | lolcat &&  sleep 1
    done
}

# Function extract for common file formats
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# Don't Delete
[[ $- != *i* ]] && return

# Evals
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

# Package Manager Aliases
alias p="sudo pacman -S"
alias rmv="sudo pacman -Rns"
alias upd="sudo pacman -Syu"
alias src="sudo pacman -Ss"
alias i="yay -S"

# Eza
alias ls="eza --color=always --icons=always"
alias la="eza -a --color=always --group-directories-first"
alias ll="eza -l --color=always --group-directories-first"
alias lt="eza -aT --color=always --group-directories-first"
alias l.="eza -al --color=always --group-directories-first ../"
alias l..="eza -al --color=always --group-directories-first ../../"
alias l...="eza -al --color=always --group-directories-first ../../../"

# Ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem="ps auxf | sort -nr -k 4"
alias pscpu="ps auxf | sort -nr -k 3"

# Df, Free, Grep better
alias df="df -h"               
alias free="free -m"           
alias grep="grep --color=auto"

# Zoxide instead of cd 
alias cd="z"

# Clear
alias c="clear"

# Neovim To Vim
alias vim="nvim"

# FastFetch
alias ff="fastfetch"

# Compiling Alias
alias smi="sudo make install"
alias smci="sudo make clean install"
