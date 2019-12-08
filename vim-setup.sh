#!/usr/bin/env bash

BASE_DIR="$HOME/.vim"
PLUGIN_DIR="$BASE_DIR/bundle"
COLORS_DIR="$BASE_DIR/colors"
AUTOLOAD_DIR="$BASE_DIR/autoload"
PLUGINS=(
  "kien/ctrlp.vim"
  "vim-airline/vim-airline"
  "vim-airline/vim-airline-themes"
  "scrooloose/nerdtree"
  "tpope/vim-pathogen"
  "dracula/vim"
  #"terryma/vim-multiple-cursors"
  "airblade/vim-gitgutter"
  #"leafgarland/typescript-vim"
  #"bigfish/vim-js-context-coloring"
  #"neoclide/vim-jsx-improve"
  #"posva/vim-vue"
  #"Quramy/vim-js-pretty-template"
  #"fatih/vim-go"
)

mkdir -p $PLUGIN_DIR
mkdir -p $COLORS_DIR
mkdir -p $AUTOLOAD_DIR

wget https://raw.githubusercontent.com/sonph/onehalf/master/vim/autoload/airline/themes/onehalfdark.vim -O $COLORS_DIR/onehalfdark.vim

for PLUGIN in ${PLUGINS[@]}; do
   DIRNAME="$(basename $PLUGIN)"
   # special handling for dracula
   if [ $DIRNAME = "vim" ]; then
      DIRNAME="dracula"
   fi
   git clone https://github.com/$PLUGIN.git $PLUGIN_DIR/$DIRNAME
done

cp $PLUGIN_DIR/vim-pathogen/autoload/pathogen.vim $AUTOLOAD_DIR/pathogen.vim
