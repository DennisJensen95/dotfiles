#!/bin/bash

update() {
	echo "==========================================================="
	echo "             Installing tmux                               "
	echo "-----------------------------------------------------------"
	sudo apt-get update -y
}

install_tmux() {
	echo "==========================================================="
	echo "             Installing tmux                               "
	echo "-----------------------------------------------------------"
	sudo apt-get install tmux -y
}

configure_tmux() {
	echo "==========================================================="
	echo "             Configuring tmux                              "
	echo "-----------------------------------------------------------"
	cat .tmux.conf >$HOME/.tmux.conf
}

install_pyenv() {
	echo "==========================================================="
	echo "             Installing pyenv                              "
	echo "-----------------------------------------------------------"
	curl https://pyenv.run | bash
}

install_zshrc() {
	echo "==========================================================="
	echo "             cloning zsh-autosuggestions                   "
	echo "-----------------------------------------------------------"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	echo "==========================================================="
	echo "                 cloning zsh-zsh-nvm                       "
	echo "-----------------------------------------------------------"
	git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
	echo "==========================================================="
	echo "                  Import zshrc                             "
	echo "-----------------------------------------------------------"
	cat .zshrc >$HOME/.zshrc
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
	sudo apt-get install bat -y
	ln -s /usr/bin/batcat ~/.local/bin/bat
}

install_exa() {
	echo "==========================================================="
	echo "                  Installing exa                           "
	echo "-----------------------------------------------------------"
	zsh -c "$HOME/.nix-profile/bin/nix-env -iA nixpkgs.exa"
}

install_github_copilot_cli() {
	echo "==========================================================="
	echo "                  Installing copilot-cli                   "
	echo "-----------------------------------------------------------"
	npm install -g @githubnext/github-copilot-cli
}

install_neovim_lazy() {
	echo "==========================================================="
	echo "                  Install neovim Lazy                      "
	echo "-----------------------------------------------------------"
	ln -s $(pwd)/nvim $HOME/.config/nvim
}

# Sequence of installs
update

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
install_github_copilot_cli
install_neovim_lazy
