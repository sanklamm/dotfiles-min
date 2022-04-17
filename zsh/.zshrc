# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/sean/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git tmux python pip history-substring-search z
  composer copyfile copypath copybuffer cp docker docker-compose man
  emacs emoji emoji-clock extract fancy-ctrl-z git-flow lein pass pip sudo
  vagrant
)

source $ZSH/oh-my-zsh.sh

# User configuration
#
# Plugins:
#
# Docker Plugin:
## allow stacking of options
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

HISTSIZE='100000'
SAVEHIST="${HISTSIZE}"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export TERMINAL='gnome-terminal'

export PATH="/home/sean/.local/bin:$PATH"
export PATH="/home/sean/.emacs.d/bin:$PATH"
export PATH="/home/sean/PhpStorm/bin:$PATH"
export _JAVA_AWT_WM_NONREPARENTING=1
export INFOPATH="~/info"

#TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
#'avg shared (code):         %X KB'$'\n'\
#'avg unshared (data/stack): %D KB'$'\n'\
#'total (sum):               %K KB'$'\n'\
#'max memory:                %M MB'$'\n'\
#'page faults from disk:     %F'$'\n'\
#'other page faults:         %R'

# enable DockerExec
# PROXY_PATH='/home/sean/projects/nginx-proxy'
# alias DockerExec='PROXY_PATH=$PROXY_PATH /home/sean/projects/nginx-proxy/DockerExec'
PROXY_PATH=/home/sean/PhpstormProjects/docker-proxy-stack/
alias DockerExec='PROXY_PATH=$PROXY_PATH /home/sean/PhpstormProjects/docker-proxy-stack/DockerExec'


alias vim=nvim
alias vi=vim
alias vimdiff="nvim -d"
alias mc="mc -b"
alias docker-fullstop='docker stop $(docker ps -aq) && sudo service mysql stop'
alias storm="~/Apps/PhpStorm/bin/phpstorm.sh &"
alias ls=exa
alias la="exa -la"
alias eZ="nvim ~/.zshrc"
alias eV="nvim ~/.config/nvim/init.vim"
alias eA="nvim ~/.config/awesome/rc.lua"
alias eT="nvim ~/.config/awesome/themes/darkblue/theme.lua"
alias fzfd='cd "$(fd -H -t d | fzf --layout=reverse)"'
alias ec="emacsclient -c"
#alias dcu="docker-compose -f ~/projects/dev-proxy/docker-compose.yml up -d && docker-compose up"

ff() { fzf | xargs -r -I % $EDITOR % ; }
fp() { du -a ~/PhpstormProjects/* | grep .php$ | awk '{print $2}' | fzf | xargs -r $EDITOR ; }

# opam configuration
test -r /home/sean/.opam/opam-init/init.zsh && . /home/sean/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# fzf options
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}


export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'
