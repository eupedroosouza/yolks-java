FROM        --platform=$TARGETOS/$TARGETARCH ibm-semeru-runtimes:open-8-jdk

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

COPY ../install.sh /install.sh
RUN chmod +x /install.sh
RUN /install.sh

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
