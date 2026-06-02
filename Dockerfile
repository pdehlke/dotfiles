FROM fedora:44

ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8
# Let the container know that there is no tty
ARG DEBIAN_FRONTEND=noninteractive

RUN dnf copr enable -y jdxcode/mise && \
  dnf install -y \
  chezmoi \
  zsh \
  curl \
  wget \
  vim \
  tmux \
  mise \
  git && \
  dnf clean all

RUN groupadd yadr && \
  useradd -l -m -s /bin/zsh -g yadr yadr

USER yadr
WORKDIR /home/yadr
RUN chezmoi init --apply --verbose --source ~/.yadr --no-pager pdehlke/dotfiles && \
  mise install

ENTRYPOINT ["/bin/zsh"]
