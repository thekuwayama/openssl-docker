FROM ubuntu:22.10

ARG version="3.0.7"

RUN apt-get update && apt-get install -y --no-install-recommends \
        autoconf \
        bison \
        build-essential \
        ca-certificates \
        curl \
        gzip \
        libreadline-dev \
        patch \
        pkg-config \
        sed \
        zlib1g-dev

RUN mkdir -p /build/openssl
RUN curl -s https://www.openssl.org/source/openssl-${version}.tar.gz | tar -C /build/openssl -xzf - && \
        cd /build/openssl/openssl-${version} && \
        ./Configure \
        --prefix=/opt/openssl/openssl-${version} \
        enable-crypto-mdebug enable-crypto-mdebug-backtrace \
        linux-aarch64 && \
        make && make install_sw

ENV LD_LIBRARY_PATH /opt/openssl/openssl-${version}/lib
ENV PATH /opt/openssl/openssl-${version}/bin:$PATH

EXPOSE 4433
