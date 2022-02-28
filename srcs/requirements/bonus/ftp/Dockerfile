FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install vsftpd && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root

COPY ./conf/vsftpd.conf /etc/
COPY ./scripts/* ./
RUN mkdir -p /var/run/vsftpd/empty

ENTRYPOINT [ "bash", "init.sh" ]
CMD [ "vsftpd" ]
