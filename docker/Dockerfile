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
        mariadb-client \
        default-libmysqlclient-dev \
        git \
        libssl-dev \
        screen && \
    locale-gen en_US.UTF-8

WORKDIR /server

# Build the latest version from git
RUN git clone https://github.com/ajfouts/Tethealla.git psobb_server && \
    cd psobb_server && \
    git checkout docker_updates && \
    git submodule update --init && \
    mkdir build && \
    cd build && \
    cmake -DNO_SQL=OFF .. && \
    make -j $(nproc) && \
    mv ./deploy/* /server && \
    cd /server && \
    rm -rf ./psobb_server

# Copy the overrides to configs and our own tools.
COPY . .

CMD ["./entrypoint.sh"]
