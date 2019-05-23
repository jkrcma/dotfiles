# Path to your oh-my-zsh installati
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

source ~/.fonts/devicons-regular.sh
source ~/.fonts/fontawesome-regular.sh
source ~/.fonts/octicons-regular.sh
source ~/.fonts/pomicons-regular.sh

ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.oh-my-zsh/custom/powerlevel10k.sh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
export HISTSIZE=500000

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration
export PATH="/home/taiku/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export CDPATH=".:$HOME/Heureka:$HOME/Projekty"
export GREP_OPTIONS="--color=always"
export GREP_COLOR="1;30;43"
# export MANPATH="/usr/local/man:$MANPATH"
#

ZSH_AUTOSUGGEST_USE_ASYNC=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git python zsh-syntax-highlighting gpg-agent mosh httpie kubectl zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# hack to avoid shitty quoting of file names
alias ls='ls -N --color=auto'
alias l='exa -lga'
alias lsa='exa -lga'
alias ll='exa -lg'
alias la='exa -lga'

alias ip='ip -c'
alias ssh-add='ssh-add -t 8h'
alias sa='ssh-add'
alias sap='ssh-add ~/Projekty/id_ed25519 ~/Projekty/id_rsa'
alias sak='ssh-add ~/Projekty/id_ed25519-kraja'
alias wiki='gollum -r `git rev-parse --abbrev-ref HEAD`'

function git_clean_branches {
	git remote prune origin
	git br --merged master | grep -v '^*' | grep -v 'master$' | xargs git branch -d
}

function genpasswd {
	LC_CTYPE="C"
	tr -dc A-Za-z0-9_ < /dev/urandom | head -c 20 | xargs
	LC_CTYPE="UTF-8"
}

function s {
	mosh $1.dh.czech
}
compdef s=ssh

function pip_update_docker {
	docker run -ti --rm -v "$(pwd):/app" --entrypoint sh ${1:-"python:3-alpine"} -c "cd /app; pip install pip-tools; pip-compile --verbose --upgrade requirements.in"
}
function pypy3 {
	docker run -ti --rm -v "$PWD":/usr/src/app -w /usr/src/app pypy:3-slim pypy3 $@
}
alias ydl_docker='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data vimagick/youtube-dl'

alias vpn_connect='qdbus-qt5 org.kde.kwalletd5 /modules/kwalletd5 readPassword "$( qdbus-qt5 org.kde.kwalletd5 /modules/kwalletd5 org.kde.KWallet.open kdewallet 0 "openconnect" )" "Passwords" "Heureka VPN" "openconnect" | \
    sudo -p "[sudo] Password: " openconnect -q --user=jakub.krcma --authgroup=devel --passwd-on-stdin --non-inter vpn.hadmin.cz'

unsetopt AUTO_REMOVE_SLASH
unsetopt EXTENDED_GLOB

