if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f "${ZDOTDIR}/aliasrc" ] && source "${ZDOTDIR}/aliasrc"

[ -f "${ZDOTDIR}/optionrc" ] && source "${ZDOTDIR}/optionrc"

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=1000

bindkey -v

zstyle :compinstall filename '/home/aakash/.config/zsh/.zshrc'
autoload -Uz compinit
compinit


source ${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ${ZDOTDIR}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${ZDOTDIR}/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[OA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OB' history-substring-search-down

export SPOTIPY_CLIENT_ID="a41f13c12c264faca145be6198b78c36"
export SPOTIPY_CLIENT_SECRET="d1aa2a1355184438ab92b6edc7c732b4"


[[ ! -f ~/.config//zsh//.p10k.zsh ]] || source ~/.config//zsh//.p10k.zsh

neofetch

source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


export NVM_DIR="$HOME/.config//nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

randmpc() {
	mpc clear && mpc add "$1" && mpc shuffle && mpc play
}

_randmpc_complete(){
	reply=($(mpc ls))
}
compctl -K _randmpc_complete randmpc
