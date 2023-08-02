ARG FROM_TAG="latest"
FROM docker.io/ubuntu:${FROM_TAG}

RUN apt-get update \
    &&  apt-get install -y sudo python3 ansible sshpass \
    && useradd --system --create-home --shell /bin/bash ansible \
    && echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible-sudo
