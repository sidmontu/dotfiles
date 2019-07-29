#!/bin/zsh

# install oh-my-zsh if its not installed
if [ -d "$HOME/.oh-my-zsh" ]
then
    echo "oh-my-zsh is already installed. Skipping."
else
    sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # oh my zsh creates a .zshrc template, but luckily saves our existing zshrc, so we have to overwrite it back
    mv .zshrc.pre-oh-my-zsh .zshrc
fi

if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]
then
    echo "zsh-autosuggestions plugin already installed. Skipping."
else
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

