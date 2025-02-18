FROM        --platform=$TARGETOS/$TARGETARCH eclipse-temurin:17-jdk-noble

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

LABEL       org.opencontainers.image.source="https://github.com/pterodactyl/yolks"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt update -y \
            && apt install -y sudo curl software-properties-common \
            && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash \
            && apt-add-repository -y ppa:git-core/ppa \
            && apt update -y \
            && apt install -y \
                curl \
                lsof \
                ca-certificates \
                openssl \
            	git-lfs  \
                tar \
                sqlite3 \
                fontconfig \
                tzdata \
                iproute2 \
                libfreetype6 \
                tini \
				zip \
				unzip

## Setup user and working directory
RUN         useradd -m -d /home/container -s /bin/bash container
USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
