# Gradescope uses Ubuntu 18.04 as the base image.
FROM gradescope/auto-builds
LABEL maintainer="dani@makeschool.com"


# Configure Go version.
# Defaults to 1.13.7 unless overridden via `docker build`.
ARG GOLANG_VERSION=1.13.7
ENV GOLANG_SOURCE_ARCHIVE="go${GOLANG_VERSION}.linux-amd64.tar.gz"


# Install Go.
RUN apt-get update -y && apt-get install -y build-essential wget
RUN cd /tmp && \
    wget https://dl.google.com/go/go${GOLANG_SOURCE_ARCHIVE} && \
    tar -xvf ${GOLANG_SOURCE_ARCHIVE} && \
    mv go /usr/local && \
    export GOROOT=/usr/local/go && \
    export GOPATH=$HOME/go && \
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
