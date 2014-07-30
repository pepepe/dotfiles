# Created by newuser for 5.0.5
#export PLAY_HOME=$HOME/Library/PlayFramework/play-2.2.2
#export PATH=$PLAY_HOME:$PATH
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if which anyenv > /dev/null; then eval "$(anyenv init -)"; fi

export PATH=/usr/local/bin:$PATH
export PATH=~/.cabal/bin:$PATH

export GOPATH=$HOME/.go
export PATH=$PATH:$HOME/.go/bin


