# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="spaceship"
ZSH_THEME="eastwood"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# plugins=(
# 	zsh-autosuggestions 
# 	zsh-syntax-highlighting
# 	extract
# 	vi-mode
# 	autojump
#         )

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  # source ~/.zplug/init.zsh && zplug update --self
fi

if [[ -f ~/.zplug/init.zsh ]] {
	source ~/.zplug/init.zsh
	
	# Theme
	#zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
	
	# zsh plugins
	zplug "zsh-users/zsh-syntax-highlighting"
 	zplug "zsh-users/zsh-autosuggestions"
	zplug "zsh-users/zsh-completions"

  zplug "k4rthik/git-cal", as:command
	zplug "dylanaraps/neofetch", as:command, use:neofetch
	zplug "paulirish/git-open", as:command
  zplug "jeffreytse/zsh-vi-mode"

	zplug "plugins/tmux", from:oh-my-zsh
	zplug "plugins/docker", from:oh-my-zsh
	zplug "plugins/tmux-cssh", from:oh-my-zsh
	zplug "plugins/tmuxinator", from:oh-my-zsh
	zplug "plugins/git", from:oh-my-zsh
  zplug "plugins/git-auto-fetch", from:oh-my-zsh
  zplug "plugins/git-extras", from:oh-my-zsh
  zplug "plugins/git-flow", from:oh-my-zsh
	zplug "plugins/gitignore", from:oh-my-zsh
	zplug "plugins/extract", from:oh-my-zsh
  zplug "plugins/rand-quote", from:oh-my-zsh, rename-to: qt
	zplug "plugins/themes", from:oh-my-zsh
	zplug "plugins/cp", from:oh-my-zsh
	zplug "plugins/z", from:oh-my-zsh
	zplug "plugins/per-directory-history", from:oh-my-zsh
	zplug "plugins/command-not-found", from:oh-my-zsh
	zplug "plugins/safe-paste", from:oh-my-zsh
	zplug "plugins/history-substring-search", from:oh-my-zsh
  zplug "plugins/ripgrep", from:oh-my-zsh
	#zplug "fdw/ranger_autojump", as:command, use:"autojump.py", rename-to:rj
  zplug "ryanoasis/vim-devicons"

  # other
	zplug "~/.oh-my-zsh", from:local
	zplug "zplug/zplug", hook-build:'zplug --self--manage'


	if ! zplug check --verbose; then
		echo 'Install? [y/N]:'
		if read -q; then
			echo; zplug install
		fi
	fi
	zplug load
}

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANGUAGE=en_US.UTF-8:zh_CN.UTF-8
export LANG=en_US:zh_CN.UTF-8
export LC_ALL=C

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

if (( $+commands[nvim] )); then
  export EDITOR="nvim"
  export VISUAL="nvim"
fi
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#source ~/.config/zsh/spaceship_theme.zsh
source ~/.config/zsh/env.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/vim.zsh

nf
qt
