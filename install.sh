#!/bin/bash

echo "Installing Brew bundle..."
brew bundle

echo "Symlinking $PWD..."
rm -f ~/.dotfiles
ln -s $PWD ~/.dotfiles

for file in ~/.dotfiles/dotfiles/*; do
  echo "Installing $(basename $file)..."
  ln -s -f $file ~/.$(basename $file)
done
