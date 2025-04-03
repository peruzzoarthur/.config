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

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias t='tmux'
alias tn='cd ~/Notes/ColdNotes && tmux new -s ColdNotes'
alias v='nvim'
alias c='clear'
alias cl='clear && viu "$(~/scripts/random_image.sh ~/arthur/cats-imgs/images)" -h 10 -t'
# alias c='clear && pokemon-colorscripts -rn bulbasaur,ivysaur,venusaur,charmander,charmeleon,charizard,squirtle,wartortle,blastoise,caterpie,metapod,butterfree,weedle,kakuna,beedrill,pidgey,pidgeotto,pidgeot,rattata,raticate,spearow,fearow,ekans,arbok,pikachu,raichu,sandshrew,sandslash,nidoran-f,nidorina,nidoqueen,nidoran-m,nidorino,nidoking,clefairy,clefable,vulpix,ninetales,jigglypuff,wigglytuff,zubat,golbat,oddish,gloom,vileplume,paras,parasect,venonat,venomoth,diglett,dugtrio,meowth,persian,psyduck,golduck,mankey,primeape,growlithe,arcanine,poliwag,poliwhirl,poliwrath,abra,kadabra,alakazam,machop,machoke,machamp,bellsprout,weepinbell,victreebel,tentacool,tentacruel,geodude,graveler,golem,ponyta,rapidash,slowpoke,slowbro,magnemite,magneton,farfetchd,doduo,dodrio,seel,dewgong,grimer,muk,shellder,cloyster,gastly,haunter,gengar,onix,drowzee,hypno,krabby,kingler,voltorb,electrode,exeggcute,exeggutor,cubone,marowak,hitmonlee,hitmonchan,lickitung,koffing,weezing,rhyhorn,rhydon,chansey,tangela,kangaskhan,horsea,seadra,goldeen,seaking,staryu,starmie,mr-mime,scyther,jynx,electabuzz,magmar,pinsir,tauros,magikarp,gyarados,lapras,ditto,eevee,vaporeon,jolteon,flareon,porygon,omanyte,omastar,kabuto,kabutops,aerodactyl,snorlax,articuno,zapdos,moltres,dratini,dragonair,dragonite,mewtwo,mew --no-title'
alias day='$SCRIPTS/create-obsidian-daily-note.sh'
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

fastfetch

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

za() {
  nohup zathura "$1" & disown & clear
}
