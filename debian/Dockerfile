FROM debian:latest

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-setuptools \
    python3-venv \
    python3-wheel \
    vim \
    mc \
    gcc \
    g++ \   
    clang \
    htop \
    iftop \
    wget \
    curl \
    git \
    nginx \
    && apt-get clean

WORKDIR /src

CMD ["nginx", "-g", "daemon off;"]