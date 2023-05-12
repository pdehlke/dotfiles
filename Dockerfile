FROM ubuntu:20.04

LABEL maintainer="Nanda Lopes <nandalopes@gmail.com>"

ENV TERM xterm-256color

VOLUME /root/.yadr/root/vim/plugged
VOLUME /root/.zprezto

# Let the container know that there is no tty
ARG DEBIAN_FRONTEND=noninteractive

# Bootstrapping packages needed for installation
RUN apt-get update \
  && apt-get install -qqy \
    locales \
    lsb-release \
    software-properties-common \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set locale to UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
RUN localedef -i en_US -f UTF-8 en_US.UTF-8 && \
  /usr/sbin/update-locale LANG=$LANG

# Install dependencies
RUN apt-get update \
  && apt-get install -qqy \
    curl \
    git \
    sudo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install YADR dependencies
RUN apt-get update \
  && apt-get install -qqy \
    fontconfig \
    ruby-full \
    tmux \
    vim \
    wget \
    zsh \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install optional dependencies
RUN apt-get update \
  && apt-get install -qqy \
    build-essential \
    direnv \
    myrepos \
    ripgrep \
    silversearcher-ag \
    universal-ctags \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install dotfiles
COPY . /root/.yadr
WORKDIR /root/.yadr
RUN ./install.sh

# Install vim plugins
# RUN vim -es -u ~/.vimrc -i NONE -c 'PlugClean!' -c 'PlugInstall! --sync' -c 'qall'

# Run a zsh session
CMD [ "/bin/zsh" ]
