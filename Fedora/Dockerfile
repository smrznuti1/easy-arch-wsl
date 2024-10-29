FROM fedora:latest

WORKDIR /root/

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

RUN yes | pip install neovim-remote pylsp-mypy autopep8 isort ddgr --break-system-packages
RUN wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip 
RUN mkdir /usr/share/fonts 
RUN yes | unzip JetBrainsMono.zip -d /usr/share/fonts/ 
RUN npm install tree-sitter-cli -g && npm install -g yarn
RUN wget https://github.com/tekumara/typos-lsp/releases/download/v0.1.19/typos-lsp-v0.1.19-x86_64-unknown-linux-gnu.tar.gz 
RUN tar -xvf typos-lsp-v0.1.19-x86_64-unknown-linux-gnu.tar.gz 
RUN chmod +x typos-lsp 
RUN mv typos-lsp /usr/bin/typos-lsp 
RUN curl -s https://ohmyposh.dev/install.sh | bash -s && cp /root/.local/bin/oh-my-posh /usr/local/bin/oh-my-posh
RUN chmod u+s /usr/local/bin/oh-my-posh
RUN dnf install https://github.com/PowerShell/PowerShell/releases/download/v7.4.6/powershell-7.4.6-1.rh.x86_64.rpm -y
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN useradd -m filip 
RUN sudo chsh -s /usr/bin/pwsh filip
RUN echo "filip ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/filip
RUN mkdir -p /home/filip
RUN git clone https://github.com/smrznuti1/nvc /home/filip/.config/nvim
RUN chown -R filip:filip /home/filip/.config

RUN mkdir /Lsp
RUN wget https://github.com/PowerShell/PowerShellEditorServices/releases/download/v3.20.1/PowerShellEditorServices.zip && unzip PowerShellEditorServices.zip -d PowerShellEditorServices && mv PowerShellEditorServices /Lsp && chmod -R 777 /Lsp
