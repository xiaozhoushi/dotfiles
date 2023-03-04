sudo apt update
apt install git

sudo apt install -y zsh

apt install fonts-firacode

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s -f .zshrc ~/.zshrc
source ~/.zshrc

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
sudo mv squashfs-root /
sudo ln -s -f /squashfs-root/AppRun /usr/bin/nvim
rm -rf nvim.appimage

bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) #修改对应nvim版本

apt install bat

sudo apt install tmux
git clone https://github.com/gpakosz/.tmux.git
cp .tmux/.tmux.conf .tmux.conf
ln -s -f .tmux.conf ~/.tmux.conf
cp .tmux.conf.local ~/.tmux.conf.local
rm -rf .tmux


apt install ranger
pip install pynvim
apt install w3m-img
apt install hyperfine

curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun


# sudo apt install -y alacritty
# apt install polybar
# apt install picom
# apt install dwm
#
# other
# ogham/exa
# tldr-pages/tldr
# nvbn/thefuck
# boyter/scc
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
#
