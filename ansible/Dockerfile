FROM ubuntu:24.04 AS iubuntu24
# SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3 \
    python-is-python3 \
    syncthing \
    openssh-server \
    ansible \
    && rm -rf /var/lib/apt/lists/*

ENV BASH_ENV=/root/.bash_env

COPY playbook.yml /tmp/playbook.yml
COPY inventory.ini /tmp/inventory.ini
# COPY pb-lua.yml /tmp/pb-lua.yml
COPY config-0.1-1.rockspec /tmp/config-0.1-1.rockspec
COPY .bash_env ${BASH_ENV}
COPY roles/ /tmp/roles/

# Use bash for the shell
# Create a script file sourced by both interactive and non-interactive bash shells
WORKDIR /tmp
RUN echo 'source "${BASH_ENV}"' >> ~/.bashrc
RUN ansible-playbook -i inventory.ini playbook.yml
#/&& apt clean && rm -rf /var/lib/apt/lists/* /tmp/*

# WORKDIR /root
