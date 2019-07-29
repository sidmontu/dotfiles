#!/bin/zsh

mvzshrc() {
    if [ -f "$HOME/.zshrc.pre-oh-my-zsh" ]
    then
        echo "Found .zshrc.pre-oh-my-zsh. >> mv .zshrc.pre-oh-my-zsh .zshrc."
        mv .zshrc.pre-oh-my-zsh .zshrc
    fi
}

# copied from oh-my-zsh install.sh script, with modifications to support successful bootstrapping
setup_shell() {

	# If this user's login shell is already "zsh", do not attempt to switch.
	if [ "$(basename "$SHELL")" = "zsh" ]; then
        echo "zsh is already default login shell. skipping chsh."
        return
	fi

	# If this platform doesn't provide a "chsh" command, bail out.
	if ! command_exists chsh; then
		cat <<-EOF
			I can't change your shell automatically because this system does not have chsh.
			${BLUE}Please manually change your default shell to zsh${RESET}
		EOF
		return
	fi

	echo "${BLUE}Time to change your default shell to zsh:${RESET}"

	# Prompt for user choice on changing the default login shell
	printf "${YELLOW}Do you want to change your default shell to zsh? [Y/n]${RESET} "
	read opt
	case $opt in
		y*|Y*|"") echo "Changing the shell..." ;;
		n*|N*) echo "Shell change skipped."; return ;;
		*) echo "Invalid choice. Shell change skipped."; return ;;
	esac

	# Test for the right location of the "shells" file
	if [ -f /etc/shells ]; then
		shells_file=/etc/shells
	elif [ -f /usr/share/defaults/etc/shells ]; then # Solus OS
		shells_file=/usr/share/defaults/etc/shells
	else
		error "could not find /etc/shells file. Change your default shell manually."
		return
	fi

	# Get the path to the right zsh binary
	# 1. Use the most preceding one based on $PATH, then check that it's in the shells file
	# 2. If that fails, get a zsh path from the shells file, then check it actually exists
	if ! zsh=$(which zsh) || ! grep -qx "$zsh" "$shells_file"; then
		if ! zsh=$(grep '^/.*/zsh$' "$shells_file" | tail -1) || [ ! -f "$zsh" ]; then
			error "no zsh binary found or not present in '$shells_file'"
			error "change your default shell manually."
			return
		fi
	fi

	# We're going to change the default shell, so back up the current one
	if [ -n $SHELL ]; then
		echo $SHELL > ~/.shell.pre-oh-my-zsh
	else
		grep "^$USER:" /etc/passwd | awk -F: '{print $7}' > ~/.shell.pre-oh-my-zsh
	fi

	# Actually change the default shell to zsh
	if ! chsh -s "$zsh"; then
		error "chsh command unsuccessful. Change your default shell manually."
	else
		export SHELL="$zsh"
		echo "${GREEN}Shell successfully changed to '$zsh'.${RESET}"
	fi

	echo
}

main() {

    # install oh-my-zsh if its not installed
    if [ -d "$HOME/.oh-my-zsh" ]
    then
        echo "oh-my-zsh is already installed. Skipping."
    else
        
        # install oh-my-zsh by fetching the install script
        wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
        chmod +x install.sh
        ./install.sh --unattended

        # oh my zsh creates a .zshrc template, but luckily saves our existing zshrc, so we have to overwrite it back
        mvzshrc

        # cleanup
        rm install.sh

        # install plugins
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

        # setup shell -- have to do this because we want to run in --unattended mode first, which disables chsh step.
        setup_shell

        # launch login shell
        zsh -l
    fi
}

main
