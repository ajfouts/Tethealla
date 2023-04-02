FROM debian:bullseye

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq install \
        wget \
        curl \
        nano \
        bash \
        net-tools \
        procps \
        iproute2 \
        coreutils \
        locales \
        gnutls-bin \
        cmake \
        build-essential \
        git \
        libssl-dev \
        screen && \
    locale-gen en_US.UTF-8

WORKDIR /server

# Build the latest version from git
RUN git clone https://github.com/ajfouts/Tethealla.git psobb_server && \
    cd psobb_server && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j $(nproc) && \
    mv ./deploy/* /server && \
    cd /server && \
    rm -rf ./psobb_server

# Copy the overrides to configs and our own tools.
COPY . .

CMD ["./entrypoint.sh"]
