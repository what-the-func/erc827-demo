FROM node:latest

# jessie : python 2.7
# python 2.7 only is supported by node-gyp (needed by truffle)
RUN \
    apt-get update \
    && \
    apt-get install -qy  --no-install-recommends \
    make \
    gcc \
    g++ \
    python=2.7\* \
    && \
    rm -rf /var/lib/apt/lists/*

RUN \
    npm install -g truffle
RUN \
    npm install -g truffle-flattener

RUN \
    apt-get purge -y --auto-remove \
    make \
    gcc \
    g++

WORKDIR /app
