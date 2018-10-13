FROM ubuntu:18.04

RUN apt update && apt upgrade -y && \
    apt-get install -yq software-properties-common && \
    add-apt-repository ppa:gluster/libntirpc-1.7 -y && \
    add-apt-repository ppa:gluster/glusterfs-4.1 -y && \
    add-apt-repository ppa:gluster/glusterd2-4.1 -y && \
    apt-get update && \
    apt-get install -y glusterfs-* libntirpc*

VOLUME ["/var/log/glusterfs", "/var/lib/glusterd", "/etc/glusterfs"]

CMD glusterfs --version
