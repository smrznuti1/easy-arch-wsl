FROM archlinux:multilib-devel

WORKDIR /tool_installation

RUN pacman -Syu --noconfirm
RUN pacman-key --init && pacman-key --populate archlinux && pacman -S archlinux-keyring --noconfirm && pacman -Syu --noconfirm && pacman -S --noconfirm git wget unzip zip

RUN wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip && mkdir /usr/share/fonts && unzip JetBrainsMono.zip -d /usr/share/fonts/ && rm JetBrainsMono.zip
RUN pacman -S nodejs npm ripgrep lazygit bottom --noconfirm
RUN curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz | tar xz && chmod +x gdu_linux_amd64 && mv gdu_linux_amd64 /usr/bin/gdu
RUN wget https://github.com/tree-sitter/tree-sitter/releases/download/v0.22.6/tree-sitter-linux-x64.gz && gzip -d tree-sitter-linux-x64.gz && mv tree-sitter-linux-x64 tree-sitter && chmod +x tree-sitter && mv tree-sitter /usr/bin/tree-sitter
RUN wget https://archive.archlinux.org/packages/n/neovim/neovim-0.9.5-6-x86_64.pkg.tar.zst && pacman -U neovim-0.9.5-6-x86_64.pkg.tar.zst --noconfirm
RUN wget https://github.com/tekumara/typos-lsp/releases/download/v0.1.19/typos-lsp-v0.1.19-x86_64-unknown-linux-gnu.tar.gz && tar -xvf typos-lsp-v0.1.19-x86_64-unknown-linux-gnu.tar.gz && chmod +x typos-lsp && mv typos-lsp /usr/bin/typos-lsp && rm typos-lsp-v0.1.19-x86_64-unknown-linux-gnu.tar.gz
RUN curl -s https://ohmyposh.dev/install.sh | bash -s && chmod u+s /usr/local/bin/oh-my-posh
RUN useradd -m filip && echo "filip ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/filip

USER filip
RUN mkdir /home/filip/Downloads

WORKDIR /home/filip/Downloads

RUN git clone https://aur.archlinux.org/powershell-bin.git && cd powershell-bin && makepkg -si --noconfirm && cd .. && rm -rf powershell-bin
RUN sudo pacman -S python-pip python-lsp-server --noconfirm && yes | pip install neovim-remote pylsp-mypy autopep8 isort --break-system-packages
RUN mkdir /home/filip/Lsp/ && wget https://github.com/PowerShell/PowerShellEditorServices/releases/download/v3.20.1/PowerShellEditorServices.zip && unzip PowerShellEditorServices.zip -d PowerShellEditorServices && mv PowerShellEditorServices /home/filip/Lsp/
RUN sudo ln -s /home/filip/.local/bin/* /usr/bin/
RUN sudo chsh -s /usr/bin/pwsh filip

RUN yes | pwsh -Command 'Install-Module Terminal-Icons'
RUN sudo pacman -S openssh xorg --noconfirm

USER root
