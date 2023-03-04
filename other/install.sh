#!/bin/sh

set -o nounset # error when referencing undefined variable
set -o errexit # exit when command fails

install() {
	[ "$(uname)" == "Darwin" ] && installMac
	[ -n "$(uname -a | grep Ubuntu)" ] && installUbuntu
	[ -n "$(uname -a | grep Debian)" ] && installDebian
	[ -f "/etc/arch-release" ] && installArch
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
}

installMac() {
	echo "update source..."
	brew update
	# install pip
	which pip3 >/dev/null && echo "pip installed, moving on..." ||

	sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	rm get-pip.py
	# install node
	which node >/dev/null && echo "node installed, moving on..." ||
	brew install lua
	brew install node
	brew install yarn
	



	brew install ripgrep fzf ranger
	npm install -g tree-sitter-cli
}

installUbuntu() {
	echo "update source..."
	sudo apt update
	which pip3 >/dev/null && echo "pip installed, moving on..." || sudo apt install python3-pip >/dev/null
	which node >/dev/null && echo "node installed, moving on..." || sudo apt install nodejs
	sudo apt install npm
	mkdir ~/.npm-global
	npm config set prefix '~/.npm-global'

	sudo apt install tmux
	apt install ranger
  mv lvim lvim.new
  mv lvim.old lvim

	echo "install zsh..."
	sudo apt install -y zsh

	echo "install font..."
	sudo apt install fonts-firacode

	echo "install ohmyzsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	ln -s -f ../.zshrc ~/.zshrc

	'''
	echo "install anaconda..."
	wget https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh
	sh ...
	'''

	echo "install neovim..."
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod u+x nvim.appimage
	./nvim.appimage --appimage-extract
	./squashfs-root/AppRun --version
	sudo mv squashfs-root /
	sudo ln -s -f /squashfs-root/AppRun /usr/bin/nvim
	rm -rf nvim.appimage

	npm install -g tree-sitter-cli
	pip3 install pynvim -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com
	curl --proto '=https' --tlsv1.3 -sSf https://sh.rustup.rs | sh
	#rustup toolchain install nightly #指定新版本
	rustup default nightly

	echo "install lunarvim..."
	#bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) #修改对应nvim版本
	LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)


	echo "install tmux..."
	git clone https://github.com/gpakosz/.tmux.git
	cp .tmux/.tmux.conf ../.tmux.conf
	ln -s -f ../.tmux.conf ~/.tmux.conf
	cp .tmux/.tmux.conf.local ~/.tmux.conf.local
	rm -rf .tmux



	echo "install lazygit..."
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
  rm lazygit*


	echo "install other..."
	#apt install w3m-img
	apt install hyperfine
	apt install bat fd-find
	sudo apt install ripgrep fzf
	sudo apt install libjpeg8-dev zlib1g-dev libxtst-dev
  sudo apt install python-dev python3-dev
  sudo apt install net-tools
	#pip3 install ueberzug
	pip3 install neovim-remote
	sudo apt install -y thefuck

	echo "install docker..."
	curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

	echo "install lazydocker..."
	curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash


}

installDebian() {
	echo "update source..."
	sudo apt update
	which pip3 >/dev/null && echo "pip installed, moving on..." || sudo apt install python3-pip >/dev/null
	which node >/dev/null && echo "node installed, moving on..." || sudo apt install nodejs
	sudo apt install npm
	mkdir ~/.npm-global
	npm config set prefix '~/.npm-global'
	echo "install zsh..."
	sudo apt install -y zsh

	echo "install font..."
	sudo apt install fonts-firacode

	echo "install ohmyzsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	ln -s -f .zshrc ~/.zshrc
	source ~/.zshrc

	echo "install neovim..."
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod u+x nvim.appimage
	./nvim.appimage --appimage-extract
	./squashfs-root/AppRun --version
	sudo mv squashfs-root /
	sudo ln -s -f /squashfs-root/AppRun /usr/bin/nvim
	rm -rf nvim.appimage

	echo "install lunarvim..."
	bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) #修改对应nvim版本

	echo "install tmux..."
	sudo apt install tmux
	git clone https://github.com/gpakosz/.tmux.git
	cp .tmux/.tmux.conf .tmux.conf
	ln -s -f .tmux.conf ~/.tmux.conf
	cp .tmux.conf.local ~/.tmux.conf.local
	rm -rf .tmux

	echo "install docker..."
	curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun


	echo "install lazygit..."
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
  rm lazygit.tar.gz

	echo "install lazydocker..."
	curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

	echo "install other..."
	apt install ranger
	pip install pynvim
	apt install w3m-img
	apt install hyperfine
	apt install bat fd-find
	which pip3 >/dev/null && pip3 install ueberzug || echo "Not installing ueberzug pip not found"
	sudo apt install ripgrep fzf
	sudo apt install libjpeg8-dev zlib1g-dev python-dev python3-dev libxtst-dev
	pip3 install ueberzug
	pip3 install neovim-remote
	sudo apt install -y thefuck





}

installArch() {
	echo "update source..."
	sudo pecman update
	pacman -S python-pip
	which node >/dev/null && echo "node installed, moving on..." ||
	sudo pacman -S nodejs
	sudo pacman -S npm





	sudo pacman -S install ripgrep fzf ranger
	which yay >/dev/null && yay -S python-ueberzug-git || pipinstallueberzug
	pip3 install neovim-remote
	npm install -g tree-sitter-cli
}





# Welcome
echo 'Installing env'

# install
install
source ~/.zshrc

echo "Done"


# sudo apt install -y alacritty
# apt install polybar
# apt install picom
# apt install dwm
#
#
# other
# ogham/exa
# tldr-pages/tldr
# nvbn/thefuck
# boyter/scc
# dandavison/delta
#
# vim 插件
# lua
# packer.nvim
# colorscheme
# lsp
# nvim-tree
# symbols-outline
# treesitter
# telescope
# bufferline


