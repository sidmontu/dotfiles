# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/sidmontu/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel9k/powerlevel9k"

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
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# open
alias open=gnome-open

# Sublime Text
export PATH=$PATH:/opt/sublime_text

# Xilinx
# export PATH=${PATH}:/opt/Xilinx/SDK/2015.4/bin
# export PATH=${PATH}:/opt/Xilinx/Vivado/2015.4/bin
# export PATH=${PATH}:/opt/Xilinx/Vivado_HLS/2015.4/bin
# source /opt/Xilinx/Vivado/2015.4/settings64.sh

export PATH=$PATH:/opt/Xilinx/SDK/2018.3/bin
export PATH=$PATH:/opt/Xilinx/Vivado/2018.3/bin
source /opt/Xilinx/Vivado/2018.3/settings64.sh

# export PATH=$PATH:/opt/Xilinx/SDK/2018.3/bin
# export PATH=$PATH:/opt/Xilinx/Vivado/2018.3/bin
# source /opt/Xilinx/Vivado/2018.3/settings64.sh

# export PATH=$PATH:/opt/Xilinx/SDK/2017.4/bin
# export PATH=$PATH:/opt/Xilinx/Vivado/2017.4/bin
# source /opt/Xilinx/Vivado/2017.4/settings64.sh

# Altera
export PATH=$PATH:/home/sidmontu/intelFPGA_pro/18.0/quartus/bin

# PaToH
export PATH=$PATH:/opt/patoh

# Virtualenv Python working dir
export WORKON_HOME=~/Envs # needed for virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

# license files
export LM_LICENSE_FILE=2100@10.65.196.228:2200@10.65.196.228
export XILINXD_LICENSE_FILE=2100@10.65.196.228:/opt/Xilinx/13.4/license/Xilinx.lic
export ALTERAD_LICENSE_FILE=2200@10.65.196.228

# rust
source ~/.cargo/env

setopt promptsubst
PS1=$'${(r:$COLUMNS::_:)}'$PS1

# better dirs
alias dirs="dirs -v"

# locales
# export LC_ALL=C; unset LANGUAGE

# gnuradio/rfnoc
source ~/rfnoc/setup_env.sh

# .cfg dotfiles alias
alias config='/usr/bin/git --git-dir=/home/sidmontu/.cfg/ --work-tree=/home/sidmontu'
