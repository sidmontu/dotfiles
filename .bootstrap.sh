#!/bin/zsh

sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# oh my zsh creates a .zshrc template, but luckily saves our existing zshrc, so we have to overwrite it back
mv .zshrc.pre-oh-my-zsh .zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
config config --local status.showUntrackedFiles no

