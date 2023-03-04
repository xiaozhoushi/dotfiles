# plugins setting
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

if [ -n "$RANGER_LEVEL" ]; then export PS1="[ranger]$PS1"; fi
