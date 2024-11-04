#!/bin/bash
# sudo -i -u filip bash << EOF

mkdir /home/filip/Downloads

cd /home/filip/Downloads

git clone https://aur.archlinux.org/powershell-bin.git 
cd powershell-bin 
makepkg -si --noconfirm 
cd .. 
rm -rf powershell-bin
sudo pacman -S python-pip python-lsp-server --noconfirm 
yes | pip install neovim-remote pylsp-mypy autopep8 isort --break-system-packages
mkdir /home/filip/Lsp/ 
wget https://github.com/PowerShell/PowerShellEditorServices/releases/download/v3.20.1/PowerShellEditorServices.zip 
unzip PowerShellEditorServices.zip -d PowerShellEditorServices 
mv PowerShellEditorServices /home/filip/Lsp/
sudo ln -s /home/filip/.local/bin/* /usr/bin/
sudo chsh -s /usr/bin/pwsh filip

yes | pwsh -Command 'Install-Module Terminal-Icons'
sudo pacman -S openssh xorg openssl vim --noconfirm
git clone https://aur.archlinux.org/yay.git 
cd yay 
makepkg -si --noconfirm 
cd .. 
rm -rf yay

git clone https://github.com/smrznuti1/nvc /home/filip/.config/nvim
