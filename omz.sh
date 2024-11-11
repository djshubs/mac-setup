#!/bin/zsh

# Check if Oh My Zsh is installed by looking for the .oh-my-zsh directory
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is not installed. Installing now..."
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
else
    echo "Oh My Zsh is already installed."
fi
