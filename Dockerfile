FROM ubuntu:18.04

RUN apt update && apt upgrade -y && \
    apt install -yq git automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev libxmu-dev && \
    apt install -yq libtool libxmu-headers freeglut3-dev libxext-dev libxi-dev zlib1g-dev g++-8 gcc-8 python2.7 python3 && \
    apt install -yq flex libsqlite3-dev zlib1g-dev libacl1-dev uuid-dev bison libxml2-dev liburcu-dev

RUN git clone https://github.com/gluster/glusterfs /glusterfs && \
    cd /glusterfs && \
    git checkout tags/v5.0rc1

RUN cd /glusterfs && \
    ./autogen.sh && \    
    ./configure && \
    make && \
    make install
    
CMD glusterfs --version
