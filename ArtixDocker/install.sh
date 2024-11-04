#! /bin/bash

set -x 

# sudo -i -u root bash << EOF

pacman -Syu --noconfirm
pacman-key --init 
pacman-key --populate archlinux 
pacman -S archlinux-keyring --noconfirm 
pacman -Syu --noconfirm 
pacman -S --noconfirm git wget unzip zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip 
mkdir /usr/share/fonts 
yes | unzip JetBrainsMono.zip -d /usr/share/fonts/ 
rm JetBrainsMono.zip
pacman -S nodejs npm ripgrep lazygit bottom --noconfirm
curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz | tar xz 
chmod +x gdu_linux_amd64 
mv gdu_linux_amd64 /usr/bin/gdu
wget https://github.com/tree-sitter/tree-sitter/releases/download/v0.22.6/tree-sitter-linux-x64.gz 
gzip -d tree-sitter-linux-x64.gz 
mv tree-sitter-linux-x64 tree-sitter 
chmod +x tree-sitter 
mv tree-sitter /usr/bin/tree-sitter
pacman -S neovim --noconfirm
wget https://github.com/tekumara/typos-lsp/releases/download/v0.1.19/typos-lsp-v0.1.19-x86_64-unknown-linux-gnu.tar.gz 
tar -xvf typos-lsp-v0.1.19-x86_64-unknown-linux-gnu.tar.gz 
chmod +x typos-lsp 
mv typos-lsp /usr/bin/typos-lsp 
rm typos-lsp-v0.1.19-x86_64-unknown-linux-gnu.tar.gz
curl -s https://ohmyposh.dev/install.sh | bash -s 
chmod u+s /usr/local/bin/oh-my-posh
useradd -m filip 
echo "filip ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/filip

