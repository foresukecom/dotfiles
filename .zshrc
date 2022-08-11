# Ctrl+Dでログアウトしてしまうことを防ぐ
setopt IGNOREEOF

# グロブ展開防止
setopt nonomatch

# 日本語を使用
export LANG=ja_JP.UTF-8

# パスを追加したい場合
export PATH="$HOME/bin:$PATH"

# 色を使用
autoload -Uz colors
colors

# 補完
autoload -Uz compinit
compinit

# 他のターミナルとヒストリーを共有
#setopt share_history

# ヒストリーに重複を表示しない
setopt histignorealldups

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# ### prompt ######################
PROMPT="[%D{%Y/%m/%d} %*] ${reset_color}%~
%# "

export LS_COLORS

# Git 
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'


### autojump ########################
autoload -U compinit && compinit
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
# setopt share_history
setopt auto_cd
setopt auto_pushd
#setopt correct
setopt list_packed
setopt nolistbeep

# alias
alias ls='ls -G'
alias la='ls -la'
alias ll='ls -l'
alias cp='cp -i'
alias -g L='| less'
alias -g G='| grep'

alias aws='docker run --rm -ti -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli'

export PATH=$HOME/.nodebrew/current/bin:$PATH
