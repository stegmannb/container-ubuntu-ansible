FROM docker.io/ubuntu:jammy

RUN apt-get update \
    &&  apt-get install -y sudo python3 ansible sshpass \
    && useradd --system --create-home --shell /bin/bash ansible \
    && echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible-sudo