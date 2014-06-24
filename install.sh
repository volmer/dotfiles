#!/bin/bash

echo "Symlinking $PWD..."
rm -f ~/.dotfiles
ln -s $PWD ~/.dotfiles

for file in ~/.dotfiles/dotfiles/*; do
  echo "Installing $(basename $file)..."
  rm ~/.$(basename $file)
  ln -s $file ~/.$(basename $file)
done
