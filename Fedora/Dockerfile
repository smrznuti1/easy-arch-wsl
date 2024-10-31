FROM nobara-img

WORKDIR /root/
COPY nobaraproject-org.cert /etc/pki/ca-trust/source/anchors/

RUN update-ca-trust

RUN dnf update -y && dnf install \
    curl \
    wget \
    unzip \
    nodejs \
    npm \
    ripgrep \
    # lazygit \
    # bottom \
    python3 \
    neovim \
    git \
    python-pip \
    python-lsp-server \
    openssh \
    # xorg \
    openssl \
    clang \
    vim \
    -y
RUN dnf install sudo
RUN dnf install https://github.com/PowerShell/PowerShell/releases/download/v7.4.6/powershell-7.4.6-1.rh.x86_64.rpm -y
RUN useradd -m filip 
RUN chmod +s /usr/bin/sudo
RUN usermod -a filip -G root
RUN echo "filip ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/filip

USER filip
WORKDIR /home/filip

RUN sudo chsh -s /usr/bin/pwsh filip
RUN git clone https://github.com/smrznuti1/nvc /home/filip/.config/nvim
RUN sudo chown -R filip:filip /home/filip/.config

RUN yes | pip install neovim-remote pylsp-mypy autopep8 isort ddgr --break-system-packages
RUN wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip 
RUN mkdir -p /usr/share/fonts 
RUN yes | sudo unzip JetBrainsMono.zip -d /usr/share/fonts/ 
RUN sudo npm install tree-sitter-cli -g && sudo npm install -g yarn
RUN wget https://github.com/tekumara/typos-lsp/releases/download/v0.1.19/typos-lsp-v0.1.19-x86_64-unknown-linux-gnu.tar.gz 
RUN tar -xvf typos-lsp-v0.1.19-x86_64-unknown-linux-gnu.tar.gz 
RUN sudo chmod +x typos-lsp 
RUN sudo mv typos-lsp /usr/bin/typos-lsp 
RUN curl -s https://ohmyposh.dev/install.sh | bash -s && sudo cp /home/filip/.local/bin/oh-my-posh /usr/local/bin/oh-my-posh
RUN sudo chmod u+s /usr/local/bin/oh-my-posh
RUN sudo ln -s /home/filip/.local/bin/* /usr/bin
# RUN ln -s /usr/bin/python3 /usr/bin/python


RUN sudo mkdir /Lsp
RUN wget https://github.com/PowerShell/PowerShellEditorServices/releases/download/v3.20.1/PowerShellEditorServices.zip && unzip PowerShellEditorServices.zip -d PowerShellEditorServices && sudo mv PowerShellEditorServices /Lsp && sudo chmod -R 777 /Lsp
