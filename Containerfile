ARG versiontag="latest"
FROM docker.io/ubuntu:${versiontag}

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       sudo \
       bash \
       python3 \
       software-properties-common \
       rsyslog \
       systemd \
       systemd-cron \
    && apt-get clean \
    && rm -Rf /usr/share/doc \
    && rm -Rf /usr/share/man \
    && rm -rf /var/lib/apt/lists/* \
    && touch -d "2 hours ago" /var/lib/apt/lists \
    && useradd --system --create-home --shell /bin/bash ansible \
    && echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible-sudo

RUN sed -i 's/^\($ModLoad imklog\)/#\1/' /etc/rsyslog.conf

RUN rm -f /lib/systemd/system/systemd*udev* \
  && rm -f /lib/systemd/system/getty.target
