# container-ubuntu-ansible

An Ubuntu container used for testing Ansible roles.
Can run with systemd as init.

## Tags

This repository currently supports the tags `latest`, `kinetic`, `jammy`, `focal` and `bionic`.

The tags follow the conventions of the [official ubuntu docker image](https://hub.docker.com/_/ubuntu).

## Podman / Docker example

```bash
# Create the container without systemd and log in
podman run --interactive --tty ghcr.io/stegmannb/container-ubuntu-ansible:latest
```

## Podman / Docker systemd example

```bash
# Create the container with systemd
podman run --detach --entrypoint /lib/systemd/systemd --cap-add SYS_ADMIN --volume /sys/fs/cgroup:/sys/fs/cgroup:ro --systemd=true ghcr.io/stegmannb/container-ubuntu-ansible:latest
# Log into the container
podman exec --latest --interactive --tty /bin/bash
# Or use short flags
podman exec -itl /bin/bash
```

## Molecule systemd example

```yaml
driver:
  name: containers

platforms:
  - name: molecule-archlinux-systemd
    image: ghcr.io/stegmannb/container-ubuntu-ansible:latest
    groups:
      - archlinux
    command: /lib/systemd/systemd
    tmpfs:
      - /run
      - /tmp
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    capabilities:
      - SYS_ADMIN
```

## Molecule example

```yaml
driver:
  name: containers

platforms:
  - name: molecule-archlinux-systemd
    image: ghcr.io/stegmannb/container-ubuntu-ansible:latest
    groups:
      - archlinux
```

## Ansible systemd example

```yaml
- name: Create Archlinux test container
  containers.podman.podman_container:
    name: test-archlinux
    image: ghcr.io/stegmannb/container-ubuntu-ansible:latest
    groups:
      - archlinux
    command: /lib/systemd/systemd
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    capabilities:
      - SYS_ADMIN
```

## Ansible example

```yaml
- name: Create Archlinux test container
  containers.podman.podman_container:
    name: test-archlinux
    image: ghcr.io/stegmannb/container-ubuntu-ansible:latest
    groups:
      - archlinux
```
