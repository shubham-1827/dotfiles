# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# neofetch
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/gruvbox.omp.json)"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/snap/bin"
source /etc/zsh_command_not_found

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init --cmd cd zsh)"



### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

#using zinit to install oh my zsh plugins
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::ubuntu
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

#recommonded by documentation
zinit cdreplay -q
# powerlevel10k theme for zsh
zinit ice depth=1; zinit light romkatv/powerlevel10k

#zsh-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting
#zsh-completions
zinit light zsh-users/zsh-completions
#zsh-autosuggestions
zinit light zsh-users/zsh-autosuggestions

#load completions
autoload -U compinit && compinit

#Replace zsh's default completion selection menu with fzf!
zinit light Aloxaf/fzf-tab

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

#vi mode
# bindkey -v
# export KEYTIMEOUT=1

#history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups

#completion styling
#for always searching in lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

#for some colors when ls is used
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

#disable default completion menu for fzf to work
zstyle ':completion:*' menu no

#directory preview with fzf
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

#alias for eza
alias ls='eza --icons=always'
alias lsa='eza -A --icons=always'
alias ll='eza -h -Al --icons=always'
alias lsl='eza -h -l --icons=always'

#aliases
alias c='clear'
alias nn='neofetch'
alias shiv='nvim'
alias btop='btop --tty_on'
alias lua='lua5.4'
alias py='python3 -q'
alias pyv='python3 -V'
alias rd='rm -v -r -f'
alias rm='rm -v'

#cd aliases
alias cda='cd ..'
alias cdb='cd ../..'
alias cdc='cd ../../..'
alias cdd='cd ../../../..'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

