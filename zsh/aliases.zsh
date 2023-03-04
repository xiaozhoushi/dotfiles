alias sa="source activate"
alias da="conda deactivate"
alias x="extract"
alias qt="quote"
alias nf="neofetch"
alias l="ls -la"
alias lg="lazygit"
alias ra='ranger'
alias g='onefetch'
alias c='clear'

alias vim='lvim'
alias sde='sudo -E'
alias nb='newsboat -r'
alias ta='tmux a'
alias t='tmux'

if (( $+commands[hub] )); then eval "$(hub alias -s)"; fi
if (( $+commands[bat] )); then alias cat='bat'; fi


