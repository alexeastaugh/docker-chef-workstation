FROM ubuntu:16.04
MAINTAINER Alex Eastaugh

ARG CHANNEL=stable
ARG VERSION=3.0.36
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y locales && \
    locale-gen en_GB.UTF-8 && \
    update-locale LANG=en_GB.UTF-8 && \
    apt-get install -y wget ssh git vim tree build-essential docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=en_GB.UTF-8 \
    LANGUAGE=en_GB:en \
    LC_ALL=en_GB.UTF-8

RUN wget --content-disposition "http://packages.chef.io/files/${CHANNEL}/chefdk/${VERSION}/ubuntu/16.04/chefdk_${VERSION}-1_amd64.deb" \
    -O /tmp/chefdk.deb && \
    dpkg -i /tmp/chefdk.deb && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENV PATH="/opt/chefdk/embedded/bin:${PATH}"

RUN useradd -u 501 alex && \
    mkdir -p /home/alex && \
    chown alex:alex /home/alex && \
    usermod -a -G staff alex

RUN mkdir /chef-repo
WORKDIR /chef-repo

USER alex

CMD ["/bin/bash"]
