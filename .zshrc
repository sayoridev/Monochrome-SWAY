# ==========================
# 1. ESTETICA E PROMPT (MONOCROMATICO)
# ==========================
autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }

# Git branch discreto in grigio chiaro
zstyle ':vcs_info:git:*' formats ' %F{245} %b%f'
setopt PROMPT_SUBST

# Prompt: Path in bianco + Git in grigio + Freccia (Bianca se OK, Grigio scuro se errore)
PROMPT='%F{255}%~%f${vcs_info_msg_0_} %(?:%F{255}❯%f:%F{238}❯%f) '
# User e host in grigio cenere a destra
RPROMPT='%F{240}%n@%m%f'

# ==========================
# 2. COMPLETAMENTO COLORATO (SCALA DI GRIGI)
# ==========================
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
# Menu completamento monocromatico (sfondo grigio per l'elemento selezionato)
zstyle ':completion:*' list-colors 'no=00:fi=00:di=01;37:ln=04;37:pi=30;47:so=30;47:bd=30;47:cd=30;47:or=05;30;47:mi=05;30;47:ex=01;37'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Ignora maiuscole/minuscole

# ==========================
# 3. CRONOLOGIA E TASTI RAPIDI
# ==========================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history share_history inc_append_history

# Ricerca nella cronologia tramite freccia Su/Giù
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# ==========================
# 4. ALIAS
# ==========================
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lAh'
alias update='sudo pacman -Syu'
alias grep='grep --color=auto'

# ==========================
# 5. PLUGIN E PATH
# ==========================
# Autosuggestions in grigio scuro discreto
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=239'

[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/home/meoow/.local/bin:$PATH"

export PATH=$PATH:/home/meoow/.spicetify
export PATH=$PATH:~/.spicetify

# ==========================
# 6. OVERRIDE MONOCROMATICO ZSH HIGHLIGHTING
# ==========================
ZSH_HIGHLIGHT_STYLES[command]='fg=255,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=255,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=255,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=255,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=242'
ZSH_HIGHLIGHT_STYLES[path]='fg=250'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=245'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=245'


bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word
