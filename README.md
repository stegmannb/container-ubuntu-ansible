# container-ubuntu-ansible

An Ubuntu container used for testing Ansible roles.

## Molecule example

```yaml
driver:
  name: containers

platforms:
  - name: molecule-ubuntu-systemd
    image: ghcr.io/stegmannb/container-ubuntu-ansible:main
    pre_build_image: true
    groups:
      - ubuntu
    command: /sbin/init
    tmpfs:
      - /run
      - /tmp
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    capabilities:
      - SYS_ADMIN
```

## Ansible example

```yaml
- name: Create Ubuntu test container
  containers.podman.podman_container:
    name: test-ubuntu
    image: ghcr.io/stegmannb/container-ubuntu-ansible:main
    groups:
      - ubuntu
    command: /sbin/init
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    capabilities:
      - SYS_ADMIN
```
