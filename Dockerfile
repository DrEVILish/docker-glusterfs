FROM ubuntu:18.04

RUN apt update && apt upgrade -y && \
    install -yq git automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev libxmu-dev libxmu-headers freeglut3-dev libxext-dev libxi-dev zlib1g-dev g++-8 gcc-8

RUN git clone https://github.com/gluster/glusterfs /glusterfs && \
    cd /glusterfs && \
    git checkout tags/v5.0rc1
    
RUN cd /glusterfs && \
    ./autogen.sh
    
RUN cd /glusterfs && \    
    ./configure
    
RUN cd /glusterfs && \
    make && make install
    
RUN glusterfs --version
        
