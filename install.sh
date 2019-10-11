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

if type "code" > /dev/null 2>&1 ; then
   echo "Installing Visual Studio Code prefrences..."
   for file in ~/.dotfiles/code/*; do
     echo "Installing $(basename $file)..."
     ln -s -f $file ~/Library/Application\ Support/Code/User/$(basename $file)
   done
 else
   echo "Visual Studio Code not found! Install it and re-run this command."
 fi
