# container-archlinux-ansible

An Archlinux container used for testing Ansible roles.

## Molecule example

```yaml
driver:
  name: containers

platforms:
  - name: molecule-archlinux-systemd
    image: ghcr.io/stegmannb/container-archlinux-ansible:main
    pre_build_image: true
    groups:
      - archlinux
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
- name: Create Archlinux test container
  containers.podman.podman_container:
    name: test-archlinux
    image: ghcr.io/stegmannb/container-archlinux-ansible:main
    groups:
      - archlinux
    command: /sbin/init
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    capabilities:
      - SYS_ADMIN
```
