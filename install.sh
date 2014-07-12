#!//bin/bash

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# brewと基本的なソフトたち
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew bundle

# LL系スクリプト
git clone https://github.com/riywo/anyenv .anyenv
eval "$(anyenv init -)"
exec $SHELL -l
anyenv install rbenv
anyenv install plenv
anyenv install pyenv
anyenv install ndenv
exec $SHELL -l

# vimの初期インストール
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
mkdir -p .vim/bundle/plugin
mkdir -p .vim/backup
mkdir -p .vim/undo
mkdir -p .vim/filer_trash

# 初期設定たち
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vimrc ~/.gvimrc

