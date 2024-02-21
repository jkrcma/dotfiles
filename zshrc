# Path to your oh-my-zsh installati
export ZSH=/usr/share/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

source /usr/share/fonts/awesome-terminal-fonts/devicons-regular.sh
source /usr/share/fonts/awesome-terminal-fonts/fontawesome-regular.sh
source /usr/share/fonts/awesome-terminal-fonts/octicons-regular.sh
source /usr/share/fonts/awesome-terminal-fonts/pomicons-regular.sh

if [ `tput colors` != "256" ]; then
	ZSH_THEME="robbyrussell"
else
	ZSH_THEME="powerlevel10k/powerlevel10k"
	[ ! -f ~/.p10k.zsh ] || source ~/.p10k.zsh
	source ~/.oh-my-zsh/custom/powerlevel10k.sh
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

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
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# User configuration
GREP_OPTIONS="--color=always"
export PATH="/home/taiku/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export CDPATH=".:$HOME/Work"
export GREP_COLOR="mt=1;30;43"
[[ -z "$DISPLAY" ]] && TMOUT=600
# export MANPATH="/usr/local/man:$MANPATH"
#

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

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

[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

# hack to avoid shitty quoting of file names
alias ls='ls -N --color=auto'
alias l='lsd -la'
alias ll='lsd -lA'
alias la='lsd -la'
alias cat='bat'

alias ip='ip -c'
alias ssh-add='ssh-add -t 8h'
alias sa='ssh-add'
alias sak='ssh-add ~/.ssh/id_ed25519-kraja'

function ssh {
	[ "$TERM" = "alacritty" ] && TERM=xterm-256color
	/usr/bin/ssh "$@"
}

alias sclip='xclip -selection c'
alias gclip='xclip -selection c -o'

function git_clean_branches {
	git remote prune origin
	git br --merged master | grep -v '^*' | grep -v 'master$' | xargs git branch -d
}

function genpasswd {
	local algo=${1:-0}
	apg -a$algo -MNCL -m16 -x16
}

function chrome_pids {
	ps aux | grep chrome | grep "$1" | awk '{ print $2 }'
}

alias s='mosh'
compdef s=ssh

function pip_update_docker {
	local filename=${1:+"${1}-"}requirements
	docker run -ti --rm -v "$(pwd):/app" --entrypoint sh python:3 -c "cd /app; pip install pip-tools; pip-compile --verbose --upgrade $filename.in; chmod 644 $filename.txt; chown $(id -u):$(id -g) $filename.txt"
}
function pip_update_docker_hashes {
	local filename=${1:+"${1}-"}requirements
	docker run -ti --rm -v "$(pwd):/app" --entrypoint sh python:3 -c "cd /app; pip install pip-tools; pip-compile --verbose --generate-hashes $filename.in; chmod 644 $filename.txt; chown $(id -u):$(id -g) $filename.txt"
}
function poetry_docker {
	docker run -ti --rm -v "$(pwd):/app" --entrypoint sh python:3-alpine -c "cd /app; pip install poetry; poetry $@"
}
function pypy3 {
	docker run -ti --rm -v "$PWD":/usr/src/app -w /usr/src/app pypy:3-slim pypy3 $@
}
alias ydl_docker='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data vimagick/youtube-dl'

unsetopt AUTO_REMOVE_SLASH
unsetopt EXTENDED_GLOB

