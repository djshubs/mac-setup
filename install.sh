#!/bin/zsh

echo "Setting up your Mac..."

# Run ./omz.sh script to install Oh My Zsh configuration...
./omz.sh;    

# # Run ./brew.sh script in case it's not already installed, and it will install the necessary packages for MacOS setup.
./brew.sh;   



# Define a function which rename a `target` file to `target.backup` if the file
# exists and if it's a 'real' file, ie not a symlink
backup() {
    target=$1
    if [ -e "$target" ]; then
        if [ ! -L "$target" ]; then
            mv "$target" "$target.backup"
            echo "-----> Moved your old $target config file to $target.backup"
        fi
    fi
}

symlink() {
    file=$1
    link=$2
    if [ ! -e "$link" ]; then
        echo "-----> Symlinking your new $link from $file"
        ln -s $file $link
    fi
}

# Specify the path to your dotfiles directory
DOTFILES_DIR="dotfiles"

if [ -d "$DOTFILES_DIR" ]; then
    # For all files `$name` in the present folder except `*.zsh`,
    # backup the target file located at `~/.$name` and symlink `$name` to `~/.$name`
    for name in gitconfig gitignore zshrc zprofile; do
        if [ ! -d "$name" ]; then
            target="$HOME/.$name"
            backup $target
            symlink $PWD/$DOTFILES_DIR/$name $target
        fi
    done
else
    echo "Error: dotfiles directory not found!"
fi

# Set macOS preferences - we will run this last because this will reload the shell
source ./$DOTFILES_DIR/macos

# Refresh the current terminal with the newly installed configuration
exec zsh

echo "👌 Everything done!"