FROM ubuntu:18.04

RUN apt update && apt upgrade -y && \
    apt-get install -yq software-properties-common && \
    add-apt-repository ppa:gluster/libntirpc-1.7 -y && \
    add-apt-repository ppa:gluster/glusterfs-4.1 -y && \
    add-apt-repository ppa:gluster/glusterd2-4.1 -y && \
    apt-get update && \
    apt-get install -y glusterfs-* libntirpc*

VOLUME ["/var/log/glusterfs", "/var/lib/glusterd", "/etc/glusterfs"]

EXPOSE 2222 111 245 443 24006 24007 2049 8080 6010 6011 6012 38465 38466 38468 38469 49152 49153 49154 49156 49157 49158 49159 49160 49161 49162

CMD ["/usr/sbin/init"]
