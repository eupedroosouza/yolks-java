#!/bin/bash

apt update -y \
&& apt install -y curl \
&& curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash \
&& apt update -y \
&& apt install -y \
    curl \
    lsof \
    ca-certificates \
    openssl \
    git \
    git-lfs \
    tar \
    sqlite3 \
    fontconfig \
    tzdata \
    iproute2 \
    libfreetype6 \
    tini \
    zip \
    unzip