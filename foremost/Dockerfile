FROM kalilinux/kali-rolling

RUN apt-get update && apt-get install -y foremost
COPY foremost.conf /etc/foremost.conf
WORKDIR /mnt
