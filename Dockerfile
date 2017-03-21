FROM ubuntu:14.04

MAINTAINER Adrien

####
# Install Node.js
RUN apt-get update && \
    apt-get -y install curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
    apt-get install --yes nodejs

####
# Install ffmpeg
RUN apt-get install software-properties-common python-software-properties -y && \
    add-apt-repository multiverse && \
    add-apt-repository ppa:djcj/hybrid && \
    apt-get update -y && \
    apt-get install ffmpeg -y

####
# Install yarn package manager
RUN apt-get update && apt-get install -y curl apt-transport-https && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

####
# Install git
RUN apt-get update && apt-get install -y git

####
# Cmake 3 and build tools
RUN apt-get update -y && \
    add-apt-repository ppa:george-edison55/cmake-3.x -y && \
    apt-get update -y && \
    apt-get install cmake -y && \
    apt-get install build-essential -y

####
# Add valgrind
RUN apt-get update -y && \
    apt-get install valgrind -y
