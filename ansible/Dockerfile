FROM ubuntu:20.04 AS iubuntu20
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    vim \
    git \
    build-essential \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository --yes ppa:deadsnakes/ppa
RUN apt-get update \
    && apt-get install -y python3.12-full python-is-python3 \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.12 get-pip.py

RUN pip install --upgrade pip
RUN pip install ansible

