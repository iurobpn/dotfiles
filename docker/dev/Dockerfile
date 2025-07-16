ARG base=ubuntu:noble
FROM ${base} AS debug
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install curl gnupg2 wget git python3 python-is-python3 \
    libsqlite3-dev vim build-essential stow tmux taskwarrior direnv --yes \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN wget https://go.dev/dl/go1.24.5.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.24.5.linux-amd64.tar.gz \
    && ln -s /usr/local/go/bin/go /usr/local/bin/go \
    && rm go1.24.5.linux-amd64.tar.gz

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
    && ~/.fzf/install --all

# Install Rust
WORKDIR /tmp
RUN wget https://static.rust-lang.org/dist/rust-1.88.0-x86_64-unknown-linux-gnu.tar.xz \
    && tar -xvf rust-1.88.0-x86_64-unknown-linux-gnu.tar.xz \
    && /tmp/rust-1.88.0-x86_64-unknown-linux-gnu/install.sh \
    && rm -rf /tmp/rust-1.88.0-x86_64-unknown-linux-gnu/install.sh

# Verify installation
RUN cargo install ripgrep \
    && cargo install fd-find \
    && cargo install bat

WORKDIR /tmp
ARG version=v22.17.1
RUN curl -fsSL https://nodejs.org/dist/$version/node-$version-linux-x64.tar.xz -o /tmp/node.tar.xz \
    && tar -xvf node.tar.xz -C /opt/ \
    && rm node.tar.xz

WORKDIR /tmp
RUN curl -sS https://starship.rs/install.sh -o install.sh \
    && chmod +x install.sh \
    && ./install.sh --yes \
    && rm install.sh

WORKDIR /tmp
RUN wget https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz \
    && tar -xzf nvim-linux-x86_64.tar.gz -C /usr/local \
    && ln -s /usr/local/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim \
    && rm /tmp/nvim-linux-x86_64.tar.gz

RUN mkdir /root/git

RUN git clone --depth 1 https://github.com/iurobpn/scripts.git /root/git/scripts
RUN git clone --depth 1 https://github.com/iurobpn/dotfiles.git /root/git/dotfiles

RUN apt-get update \
    && apt-get install -y build-essential libreadline-dev unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN git clone https://luajit.org/git/luajit.git
WORKDIR /tmp/luajit
RUN make && make install \
    && rm -rf /tmp/luajit

# Install LuaRocks
WORKDIR /tmp
RUN wget https://luarocks.github.io/luarocks/releases/luarocks-3.12.2.tar.gz \
    && tar -xzf luarocks-3.12.2.tar.gz \
    && cd luarocks-3.12.2 \
    && ./configure \
    && make build \
    && make install \
    && rm -rf /tmp/luarocks-3.12.2* 

RUN luarocks install lua-cjson \
    && luarocks install inspect  \
    && luarocks install luafilesystem  \
    && luarocks install luasql-sqlite3  \
    && luarocks install dkjson  \
    && luarocks install lustache

WORKDIR /root/git/dotfiles
RUN rm /root/.profile && bin/setup.sh

WORKDIR /root

