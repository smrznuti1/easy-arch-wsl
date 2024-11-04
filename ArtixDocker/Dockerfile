FROM artixlinux/artixlinux

WORKDIR /root

COPY certificate.cert .
COPY mirrors-dotsrc-org.pem .

RUN trust anchor --store certificate.cert
RUN trust anchor --store mirrors-dotsrc-org.pem
RUN update-ca-trust


RUN pacman -Syu --noconfirm
RUN pacman -S sudo --noconfirm

COPY install.sh .

RUN chmod +x install.sh && ./install.sh

COPY ./install-filip.sh .
RUN pacman -S gcc clang nodejs yarn --noconfirm
RUN chmod +x ./install-filip.sh
RUN mkdir -p /home/filip/workdir && chown filip:filip -R /home/filip/workdir
RUN chown filip:filip ./install-filip.sh
RUN cp ./install-filip.sh /home/filip/workdir
RUN pacman -S fakeroot make doas --noconfirm

USER filip
WORKDIR /home/filip/workdir

RUN ./install-filip.sh
RUN yay -S powershell-bin --noconfirm


CMD ["/bin/bash"]
