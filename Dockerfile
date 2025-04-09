ARG distro=ubuntu:24.04
FROM ${distro}
SHELL ["/bin/bash", "-c"]
ARG DEBIAN_FRONTEND=noninteractive
ARG user=gagarin
ENV HOME=/root

# VOLUME ["${HOME}/.local", "${HOME}/.ros"]

RUN apt-get update && apt-get install -y \
    python3 \
    python-is-python3 \
    syncthing \
    openssh-server \
    ansible \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# The -s flag specifies the login shell.
# RUN adduser -m -s `which /bin/bash` ${user}

# Allow 'USER' to run sudo commands without a password by adding a sudoers entry.
# Use the "NOPASSWD" directive to disable password prompts for sudo.
# RUN echo "${user} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the new user (optional)

# RUN --mount=type=bind,target=/root/ansible/,ansible/,ro

# Use bash for the shell
# Create a script file sourced by both interactive and non-interactive bash shells

USER ${user}:${user}
RUN mkdir -p ${HOME}/.config/fish
WORKDIR ${HOME}/git/dotfiles/ansible
RUN echo "${user} with HOME=${HOME}"
# USER ${user}:${user}

RUN mkdir -p ${HOME}/.config/fish \
    && mkdir -p ${HOME}/.config/nvim \
    && mkdir -p ${HOME}/.config/coc

RUN --mount=type=bind,source=./,target=${HOME}/git/dotfiles,rw \
    ansible-playbook -i inventory.ini pb-stow-bootstrap.yml \
    && sudo apt clean \
    && sudo rm -rf /var/lib/apt/lists/*

# USER ${user}:${user}
RUN --mount=type=bind,source=./,target=${HOME}/git/dotfiles,rw \
    ansible-playbook -i inventory.ini playbook.yml \
    # && sudo -u ${user} chown -R ${user}:${user} ${HOME} \
    && sudo apt clean \
    && sudo rm -rf /var/lib/apt/lists/*

# COPY plbk-final.yml /tmp/plbk-final.yml
# RUN ansible-playbook -i inventory.ini plbk-final.yml

# USER ${user}
WORKDIR ${HOME}

