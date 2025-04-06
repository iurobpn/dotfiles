ARG DISTRO
FROM ${DISTRO:-archlinux:latest}

ARG USER=gagarin

RUN pacman -Syu --noconfirm \
    && pacman -S --noconfirm \
    python \
    python-pip \
    git \
    openssh \
    sudo \
    ansible \
    neovim \
    && pacman -Scc --noconfirm

# Create a new user with a home directory (-m) and set the shell.
# The -s flag specifies the login shell.
RUN useradd -m -s /bin/bash ${USER}

# Allow 'USER' to run sudo commands without a password by adding a sudoers entry.
# Use the "NOPASSWD" directive to disable password prompts for sudo.
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the new user (optional)
USER ${USER}
WORKDIR /home/${USER}

CMD ["bash"]
