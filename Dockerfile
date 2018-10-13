FROM ubuntu:18.04

RUN apt update && apt upgrade -y && \
    apt-get install -yq make automake autoconf libtool flex bison pkg-config libssl-dev libxml2-dev python-dev libaio-dev libibverbs-dev librdmacm-dev libreadline-dev liblvm2-dev libglib2.0-dev liburcu-dev libcmocka-dev libsqlite3-dev libacl1-dev

RUN git clone https://github.com/gluster/glusterfs /glusterfs && \
    cd /glusterfs && \
    git checkout tags/v5.0rc1

RUN cd /glusterfs && \
    ./autogen.sh && \    
    ./configure && \
    make && \
    make install
    
CMD glusterfs --version
