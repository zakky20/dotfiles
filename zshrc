# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-completions zsh-autosuggestions fast-syntax-highlighting)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit
source "$ZSH/oh-my-zsh.sh"

# Exports
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:/home/zak/.spicetify
export PATH="$HOME/.spicetify:$PATH"
export PATH=$PATH:/home/zakky/.spicetify
export TERMINAL="alacritty"
export BROWSER="zen"
export TERM="xterm-256color"
export EDITOR="nvim"

# Settings
setopt PROMPT_SUBST
setopt autocd
setopt interactive_comments
autoload -U compinit
autoload -U colors && colors	

# Path For .config
if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

# Path for .local
if [ -z "$XDG_DATA_HOME" ] ; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi

# Path For .cache
if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

# Path For EmacsD
if [ -d "$HOME/.emacs.d/bin" ] ;
  then PATH="$HOME/.emacs.d/bin:$PATH"
fi

# Path for Doom Emacs
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

# Navigation
up () {
  local d=""
  local limit="$1"
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi
  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

# Function extract for common file formats
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# Don't Delete
[[ $- != *i* ]] && return

# Fetch
fastfetch

# Evals
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

# Package Manager Aliases
alias e="sudo emerge -va"
alias eu="sudo emerge -avuDN @world"
alias er="sudo emerge --deselect"
alias edp="sudo emerge --depclean"
alias es="sudo eix-sync"
alias disp="sudo dispatch-conf"
alias nws="sudo eselect news read"
alias est="sudo genlop -ci"

# Eza
alias ls="eza --color=always --icons=always"
alias la="eza -a --color=always --icons=always --group-directories-first"
alias ll="eza -l --color=always --icons=always --group-directories-first"
alias lt="eza -aT --color=always --icons=always --group-directories-first"
alias l.="eza -al --color=always --icons=always --group-directories-first ../"
alias l..="eza -al --color=always --icons=always --group-directories-first ../../"
alias l...="eza -al --color=always --icons=always --group-directories-first ../../../"

# Ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem="ps auxf | sort -nr -k 4"
alias pscpu="ps auxf | sort -nr -k 3"

# Df, Free, Grep better
alias df="df -h"               
alias free="free -m"           
alias grep="grep --color=auto"

# Journal
alias jtl="journalctl -p 3 -xb"

# Xrdb
alias xr="xrdb -merge ~/.Xresources"

# Zoxide instead of cd 
alias cd="z"

# Bat instead of cat
alias cat="bat"

# Clear
alias c="clear"

# Neovim To Vim
alias vim="nvim"

# FastFetch
alias ff="fastfetch"

# Chmod X
alias cmx="sudo chmod +x"

# Doom Alias
alias ds="doom sync"
alias dsu="doom sync -u"
alias dr="doom doctor"

# Compiling Alias
alias smi="sudo make install"
alias smci="sudo make clean install"
