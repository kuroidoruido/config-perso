# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 5 not-numeric
zstyle ':completion:*' prompt '%e'
zstyle :compinstall filename '/home/anthony/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt autocd extendedglob notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
autoload -U promptinit
promptinit
prompt redhat

source ~/.zsh_aliases

function enable_proxy() {
	export HTTP_PROXY="http://cache.wifi.univ-nantes.fr:3128"
	export HTTPS_PROXY="http://cache.wifi.univ-nantes.fr:3128"
	export http_proxy="http://cache.wifi.univ-nantes.fr:3128"
	export https_proxy="http://cache.wifi.univ-nantes.fr:3128"
	export ALL_PROXY="http://cache.wifi.univ-nantes.fr:3128"
	export all_proxy="http://cache.wifi.univ-nantes.fr:3128"
	export FTP_PROXY="http://cache.wifi.univ-nantes.fr:3128"
	export ftp_proxy="http://cache.wifi.univ-nantes.fr:3128"
}

function disable_proxy() {
	export HTTP_PROXY=""
	export HTTPS_PROXY=""
	export http_proxy=""
	export https_proxy=""
	export ALL_PROXY=""
	export all_proxy=""
	export FTP_PROXY=""
	export ftp_proxy=""
}

#export GUROBI_HOME="/home/anthony/.gurobi600/linux64"
#export PATH="${PATH}:${GUROBI_HOME}/bin"
#export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"

export K49_TORRENT="k49@k49.fr.nf:~/download/torrent"
