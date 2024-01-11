#!/bin/bash

install_brew() {
	echo "==========================================================="
	echo "             Installing brew                               "
	echo "-----------------------------------------------------------"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_starship() {
	echo "==========================================================="
	echo "                  Installing starship                      "
	echo "-----------------------------------------------------------"
	brew install starship
}

install_tmux() {
	echo "==========================================================="
	echo "             Installing tmux                               "
	echo "-----------------------------------------------------------"
	brew install tmux
}

configure_tmux() {
	echo "==========================================================="
	echo "             Configuring tmux                              "
	echo "-----------------------------------------------------------"
	cat .tmux.conf >$HOME/.tmux.conf
}

install_zshrc() {
	echo "==========================================================="
	echo "                  Import zshrc                             "
	echo "-----------------------------------------------------------"
	cat .zshrc >$HOME/.zshrc
}

install_pyenv() {
	echo "==========================================================="
	echo "             Installing pyenv                              "
	echo "-----------------------------------------------------------"
	curl https://pyenv.run | bash
}

install_orbstack() {
	echo "==========================================================="
	echo "             Installing orbstack                           "
	echo "-----------------------------------------------------------"
	brew install --cask orbstack
}

install_vscode() {
	echo "==========================================================="
	echo "             Installing vscode                             "
	echo "-----------------------------------------------------------"
	brew install --cask visual-studio-code
}

install_teams() {
	echo "==========================================================="
	echo "             Installing teams                              "
	echo "-----------------------------------------------------------"
	brew install --cask microsoft-teams
}

install_rust() {
	echo "==========================================================="
	echo "                  Installing rust                          "
	echo "-----------------------------------------------------------"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
}

install_google_chrome() {
	echo "==========================================================="
	echo "                  Installing google chrome                 "
	echo "-----------------------------------------------------------"
	brew install --cask google-chrome
}

install_nix() {
	echo "==========================================================="
	echo "                  Installing nix                           "
	echo "-----------------------------------------------------------"
	curl -L https://nixos.org/nix/install | sh
}

configure_nix() {
	echo "==========================================================="
	echo "                  Configuring nix                          "
	echo "-----------------------------------------------------------"
	mkdir -p $HOME/.config/nix
	cat ./nix.conf >$HOME/.config/nix/nix.conf
}

install_direnv() {
	echo "==========================================================="
	echo "                  Installing direnv                        "
	echo "-----------------------------------------------------------"
	curl -sfL https://direnv.net/install.sh | bash
}

install_github() {
	echo "==========================================================="
	echo "					Install GH 								 "
	echo "-----------------------------------------------------------"
	brew install gh
	gh extension install github/gh-copilot
}

install_nerdfont() {
	echo "==========================================================="
	echo "					Install Nerd Font 						 "
	echo "-----------------------------------------------------------"
	brew tap homebrew/cask-fonts
	brew install --cask font-jetbrains-mono-nerd-font
}

configure_direnv() {
	echo "==========================================================="
	echo "                  Configuring direnv                       "
	echo "-----------------------------------------------------------"
	cat .direnvrc >$HOME/.direnvrc
}

install_poetry() {
	echo "==========================================================="
	echo "                  Installing poetry                        "
	echo "-----------------------------------------------------------"
	curl -sSL https://install.python-poetry.org | python3 -
}

install_bat() {
	echo "==========================================================="
	echo "                  Installing bat                           "
	echo "-----------------------------------------------------------"
	brew install bat
	cat "alias cat='bat'" >>$HOME/.zshrc
}

install_exa() {
	echo "==========================================================="
	echo "                  Installing exa                           "
	echo "-----------------------------------------------------------"
	zsh -c "nix-env -iA nixpkgs.eza"
}

install_neovim_lazy() {
	echo "==========================================================="
	echo "                  Install neovim Lazy                      "
	echo "-----------------------------------------------------------"
	git clone git@github.com:DennisJensen95/neovim-config.git $HOME/.dotfiles/neovim-config
	ln -s $HOME/.dotfiles/neovim-config $HOME/.config/nvim
}

install_nvm() {
	echo "==========================================================="
	echo "                  Install nvm                              "
	echo "-----------------------------------------------------------"
	brew install nvm
}

# Brew install
install_brew

# Starship install and setup
install_starship
install_zshrc

# Shell
install_tmux
configure_tmux
install_bat
install_exa

# Python
install_pyenv
install_poetry

# GitHub
install_github

# Apps
install_google_chrome
install_teams

# Nerd font
install_nerdfont

# Nix install and setup
install_nix
configure_nix

# Direnv install and setup
install_direnv
configure_direnv

# Rust install
install_rust

# Editors
install_neovim_lazy
install_vscode
