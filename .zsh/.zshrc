# Created by newuser for 5.0.5
#export PLAY_HOME=$HOME/Library/PlayFramework/play-2.2.2
#export PATH=$PLAY_HOME:$PATH
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if [ -d ${HOME}/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  for D in `ls $HOME/.anyenv/envs`
  do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi

export PATH=/usr/local/bin:$PATH
export PATH=~/.cabal/bin:$PATH

export GOPATH=$HOME/.go
export PATH=$PATH:$HOME/.go/bin

export ANDROID_HOME=/usr/local/opt/android-sdk


