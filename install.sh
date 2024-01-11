#!/bin/bash

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

install_rust() {
	echo "==========================================================="
	echo "                  Installing rust                          "
	echo "-----------------------------------------------------------"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
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
	zsh -c "$HOME/.nix-profile/bin/nix-env -iA nixpkgs.eza"
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

# Tmux install and setup
install_tmux
configure_tmux

install_zshrc
install_pyenv

# Nix install and setup
install_nix
configure_nix

# Direnv install and setup
install_direnv
configure_direnv

install_rust
install_poetry
install_bat
install_exa
install_neovim_lazy
