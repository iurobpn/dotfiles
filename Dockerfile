FROM ubuntu:24.04
# SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ARG HOME
ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /root/.local
VOLUME ["/root/.local", "/root/.ros"]

RUN apt-get update && apt-get install -y \
    python3 \
    python-is-python3 \
    syncthing \
    openssh-server \
    ansible \
    && rm -rf /var/lib/apt/lists/*

ENV BASH_ENV=/root/.bash_env

COPY ansible/pb-fish.yml /tmp/pb-fish.yml
COPY ansible/playbook.yml /tmp/playbook.yml
COPY ansible/pb-stow-bootstrap.yml /tmp/pb-stow-bootstrap.yml
COPY ansible/inventory.ini /tmp/inventory.ini
COPY ansible/config-0.1-1.rockspec /tmp/config-0.1-1.rockspec
COPY ansible/roles/ /tmp/roles/
COPY ansible/tasks/ /tmp/tasks/

# Use bash for the shell
# Create a script file sourced by both interactive and non-interactive bash shells
WORKDIR /tmp

RUN --mount=type=bind,source=./,target=/root/git/dotfiles,rw \
    ansible-playbook -i inventory.ini pb-stow-bootstrap.yml \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN --mount=type=bind,source=./,target=/root/git/dotfiles,rw \
    ansible-playbook -i inventory.ini playbook.yml \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/*

# COPY plbk-final.yml /tmp/plbk-final.yml
# RUN ansible-playbook -i inventory.ini plbk-final.yml

WORKDIR /root

