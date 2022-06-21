FROM ubuntu:20.04
LABEL maintainer="Nanda Lopes <nandalopes@gmail.com>"

ENV TERM xterm-256color
ENV CODESPACES true

# Let the container know that there is no tty
ARG DEBIAN_FRONTEND=noninteractive

# Bootstrapping packages needed for installation
RUN apt-get update && \
  apt-get install -yqq \
    locales \
    lsb-release \
    software-properties-common && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set locale to UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
RUN localedef -i en_US -f UTF-8 en_US.UTF-8 && \
  /usr/sbin/update-locale LANG=$LANG

# Install dependencies
# `universe` is needed for ruby
# `security` is needed for fontconfig and fc-cache
RUN apt-get update && \
  apt-get -yqq install \
    build-essential \
    curl \
    fontconfig \
    git \
    ruby-full \
    sudo \
    tmux \
    vim \
    wget \
    zsh && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install more dependencies
RUN apt-get update && \
  apt-get -yqq install \
    direnv \
    myrepos \
    ripgrep \
    silversearcher-ag \
    universal-ctags && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG CACHEBUST
RUN echo

# Install dotfiles
COPY . /root/.yadr
WORKDIR /root/.yadr
RUN ./install.sh

# Install vim plugins
# RUN vim -es -u ~/.vimrc -i NONE -c 'PlugClean!' -c 'PlugInstall! --sync' -c 'qall'

# Run a zsh session
CMD [ "/bin/zsh" ]
