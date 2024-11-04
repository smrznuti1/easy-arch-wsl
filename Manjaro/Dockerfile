FROM manjaro-base

WORKDIR /root

# COPY mirrorlist /etc/pacman.d/mirrorlist
COPY certificate.crt .
COPY mirrors-dotsrc-org.pem .

RUN trust anchor --store certificate.crt
RUN trust anchor --store mirrors-dotsrc-org.pem
RUN update-ca-trust


RUN sudo pacman-mirrors --fasttrack
RUN pacman-key --init 
RUN pacman-key --populate archlinux manjaro
# RUN pacman -Sy gnupg archlinux-keyring manjaro-keyring
RUN pacman-key --refresh-keys
RUN pacman -Syu --noconfirm 
RUN pacman -S archlinux-keyring --noconfirm 
RUN pacman -S --noconfirm git wget unzip zip
RUN wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip 
RUN mkdir -p /usr/share/fonts 
RUN yes | unzip JetBrainsMono.zip -d /usr/share/fonts/ 
RUN rm JetBrainsMono.zip
RUN pacman -S nodejs npm ripgrep lazygit bottom --noconfirm
RUN curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz | tar xz 
RUN chmod +x gdu_linux_amd64 
RUN mv gdu_linux_amd64 /usr/bin/gdu
RUN wget https://github.com/tree-sitter/tree-sitter/releases/download/v0.22.6/tree-sitter-linux-x64.gz 
RUN gzip -d tree-sitter-linux-x64.gz 
RUN mv tree-sitter-linux-x64 tree-sitter 
RUN chmod +x tree-sitter 
RUN mv tree-sitter /usr/bin/tree-sitter
RUN pacman -S neovim --noconfirm
RUN wget https://github.com/tekumara/typos-lsp/releases/download/v0.1.19/typos-lsp-v0.1.19-x86_64-unknown-linux-gnu.tar.gz 
RUN tar -xvf typos-lsp-v0.1.19-x86_64-unknown-linux-gnu.tar.gz 
RUN chmod +x typos-lsp 
RUN mv typos-lsp /usr/bin/typos-lsp 
RUN rm typos-lsp-v0.1.19-x86_64-unknown-linux-gnu.tar.gz
RUN curl -s https://ohmyposh.dev/install.sh | bash -s 
RUN cp /root/.local/bin/oh-my-posh /usr/local/bin/oh-my-posh
RUN chmod u+s /usr/local/bin/oh-my-posh
RUN useradd -m filip 
RUN echo "filip ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/filip




RUN pacman -S gcc clang nodejs yarn --noconfirm
RUN mkdir -p /home/filip/workdir && chown filip:filip -R /home/filip/workdir
RUN pacman -S fakeroot make doas sudo --noconfirm

USER filip
WORKDIR /home/filip/workdir

RUN mkdir /home/filip/Downloads

RUN cd /home/filip/Downloads

RUN sudo pacman -S python-pip --noconfirm
RUN yes | pip install neovim-remote 'python-lsp-server[all]' --break-system-packages
RUN mkdir /home/filip/Lsp/
RUN wget https://github.com/PowerShell/PowerShellEditorServices/releases/download/v3.20.1/PowerShellEditorServices.zip
RUN unzip PowerShellEditorServices.zip -d PowerShellEditorServices
RUN mv PowerShellEditorServices /home/filip/Lsp/

RUN sudo pacman -S openssh xorg openssl vim --noconfirm
RUN git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay

RUN git clone https://github.com/smrznuti1/nvc /home/filip/.config/nvim

RUN yay -S powershell-bin --noconfirm
RUN yes | pwsh -Command 'Install-Module Terminal-Icons'
RUN sudo chsh -s /usr/bin/pwsh filip
RUN sudo ln -s /home/filip/.local/bin/* /usr/bin/


CMD ["/bin/bash"]
