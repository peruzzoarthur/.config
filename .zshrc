# Disable Powerlevel10k instant prompt
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -f /usr/bin/fastfetch ]; then
	fastfetch
fi


# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# cli colors
export CLICOLOR=1
export LS_COLORS='di=1;36:ln=1;35:ex=1;32:so=1;31:pi=1;33:bd=1;34:cd=1;33:su=0;41:sg=0;46:tw=0;42:ow=0;43'

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias t='tmux'
alias tn='cd ~/Notes/ColdNotes && tmux new -s ColdNotes'
alias v='nvim'
alias c='clear'
# alias cl='clear && viu "$(~/scripts/random_image.sh ~/arthur/cats-imgs/images)" -h 10 -t'
# alias cl='clear && kitty +kitten icat "$(~/scripts/random_image.sh ~/arthur/cats-imgs/images)" '
alias cl='clear && magick "$(~/scripts/random_image.sh ~/arthur/cats-imgs/images)" -resize 250x250 png:- | kitty +kitten icat --stdin yes'
alias day='$SCRIPTS/create-obsidian-daily-note.sh'
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
alias history='fc -li 1'  # All history with timestamps
alias h='fc -li -500'   # Last 500 commands with timestamps

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Shell integrations
# Initialize zoxide correctly without conflicting with zinit
eval "$(zoxide init zsh | sed 's/zi()/zoxide_zi()/')"

# Initialize fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH=$PATH:/usr/bin/

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

__conda_setup="$('/home/ozzurep/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ozzurep/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/ozzurep/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ozzurep/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/ozzurep/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/ozzurep/miniforge3/etc/profile.d/mamba.sh"
fi

# <<< conda initialize <<<



export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# Created by `pipx` on 2024-09-20 15:52:20
export PATH="$PATH:/home/ozzurep/.local/bin"

fpath+=~/.zfunc
autoload -Uz compinit && compinit
# add Pulumi to the PATH
export PATH=$PATH:/home/ozzurep/.pulumi/bin


source $HOME/.cargo/env

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ozzurep/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/ozzurep/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ozzurep/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/ozzurep/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
. "/home/ozzurep/.deno/env"

# export XMODIFIERS=@im=ibus

export PATH=$PATH:~/.local/bin

ccm() {
  git diff | cody chat --stdin -m 'Write a commit message for this diff'
}

alias ll='ls -l'

# Setup bindings for both smkx and rmkx key variants
# Home
bindkey '\e[H'  beginning-of-line
bindkey '\eOH'  beginning-of-line
# End
bindkey '\e[F'  end-of-line
bindkey '\eOF'  end-of-line
# # Up
# bindkey '\e[A' up-line-or-beginning-search
# bindkey '\eOA' up-line-or-beginning-search
# # Down
# bindkey '\e[B' down-line-or-beginning-search
# bindkey '\eOB' down-line-or-beginning-search
# Left
bindkey '\e[D' backward-char
bindkey '\eOD' backward-char
# Right
bindkey '\e[C' forward-char
bindkey '\eOC' forward-char
# Delete
bindkey '\e[3~' delete-char
# Backspace
bindkey '\e?' backward-delete-char
# PageUp
bindkey '\e[5~' up-line-or-history
# PageDown
bindkey '\e[6~' down-line-or-history
# Ctrl+Left
bindkey '\e[1;5D' backward-word
# Ctrl+Right
bindkey '\e[1;5C' forward-word
# Shift+Tab
bindkey '\e[Z' reverse-menu-complete

# bun completions
[ -s "/home/ozzurep/.bun/_bun" ] && source "/home/ozzurep/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# import .env variables 
if [ -f "$HOME/.env" ]; then
  export $(cat $HOME/.env | xargs)
fi

export BAT_THEME="Nord"

export OBSIDIAN_VAULT="/home/ozzurep/Notes/ColdNotes"
export OBSIDIAN_TEMPLATES="/home/ozzurep/Notes/templates"
export COLD_NOTE_EDITOR="nvim-zen"

export BROWSER=firefox

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export GI_TYPELIB_PATH=/usr/local/lib/girepository-1.0:$GI_TYPELIB_PATH

# History configuration
export HISTSIZE=5000
export SAVEHIST=5000
export HISTFILE=~/.zsh_history

# Zsh history options
setopt APPEND_HISTORY          # Append to history file
setopt SHARE_HISTORY           # Share history between sessions
setopt HIST_IGNORE_SPACE       # Don't record commands starting with space
setopt HIST_IGNORE_ALL_DUPS    # Remove older duplicate entries
setopt HIST_SAVE_NO_DUPS       # Don't save duplicates to file
setopt HIST_FIND_NO_DUPS       # Don't show duplicates when searching
setopt EXTENDED_HISTORY        # Save timestamps

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

export EDITOR=nvim
