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
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
# End of lines configured by zsh-newuser-install
autoload -U promptinit
promptinit
prompt redhat

source ~/.zsh_aliases

export EDITOR=nano

function enable_proxy() {
	export HTTP_PROXY="http://cache.wifi.univ-nantes.fr:3128"
	export HTTPS_PROXY="http://cache.wifi.univ-nantes.fr:3128"
	export http_proxy="http://cache.wifi.univ-nantes.fr:3128"
	export https_proxy="http://cache.wifi.univ-nantes.fr:3128"
	export FTP_PROXY="http://cache.wifi.univ-nantes.fr:3128"
	export ftp_proxy="http://cache.wifi.univ-nantes.fr:3128"
	export ALL_PROXY="http://cache.wifi.univ-nantes.fr:3128"
	export all_proxy="http://cache.wifi.univ-nantes.fr:3128"
}

function disable_proxy() {
	export HTTP_PROXY=""
	export HTTPS_PROXY=""
	export http_proxy=""
	export https_proxy=""
	export FTP_PROXY=""
	export ftp_proxy=""
	export ALL_PROXY=""
	export all_proxy=""
}

export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools/:$ANDROID_HOME/platform-tools/
export QT_STYLE_OVERRIDE=gtk

function bastion_k49() {
	ssh -f -N -L:10022:k49.fr.nf:22 e114797e@bastion.etu.univ-nantes.fr
}
