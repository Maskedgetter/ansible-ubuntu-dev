# Simple .zshrc for development

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# Prompt
PROMPT='%F{cyan}%n%f@%F{green}%m%f:%F{blue}%~%f$ '

# Aliases
# ファイル操作
alias ll='ls -lAh'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# 安全性向上
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ディレクトリ操作
alias mkdir='mkdir -pv'
alias md='mkdir -pv'

# システム情報
alias df='df -h'
alias du='du -h'
alias free='free -h'

# プロセス
alias ps='ps aux'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'

# ネットワーク
alias ping='ping -c 5'
alias ports='netstat -tulanp'

# 履歴
alias h='history'
alias hg='history | grep'

# 便利なショートカット
alias c='clear'
alias e='exit'
alias path='echo -e ${PATH//:/\\n}'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'

# Docker基本コマンド
alias d='docker'
alias dc='docker compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias dlog='docker logs'
alias dlogf='docker logs -f'

# Docker コンテナ操作
alias dstart='docker start'
alias dstop='docker stop'
alias drestart='docker restart'
alias drm='docker rm'
alias drmi='docker rmi'
alias dprune='docker system prune -a'

# Docker Compose
alias dcup='docker compose up -d'
alias dcdown='docker compose down'
alias dcrestart='docker compose restart'
alias dclogs='docker compose logs -f'
alias dcps='docker compose ps'
alias dcbuild='docker compose build'
alias dcexec='docker compose exec'

# Docker便利コマンド
alias dstopall='docker stop $(docker ps -q)'
alias drmall='docker rm $(docker ps -aq)'
alias drmiall='docker rmi $(docker images -q)'
alias dclean='docker system prune -af --volumes'

# Docker情報
alias dstats='docker stats'
alias dinspect='docker inspect'
alias dnetwork='docker network ls'
alias dvolume='docker volume ls'

# Path
export PATH=$HOME/.local/bin:$PATH
