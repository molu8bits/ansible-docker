# Ansible inside docker

## Build image

```bash
docker build -t docker.io/molu8bits/ansible-docker:v1.1.0 .
```

## Info

[![License](https://img.shields.io/github/license/molu8bits/ansible-docker)](/LICENSE)
[![Release](https://img.shields.io/github/release/molu8bits/ansible-docker.svg)](https://github.com/molu8bits/ansible-docker/releases/latest)
![Docker Image Size](https://img.shields.io/docker/image-size/molu8bits/ansible-docker.svg?sort=date)
![Docker Image Version (latest by date):](https://img.shields.io/docker/v/molu8bits/ansible-docker.svg?sort=date)
![Docker Pulls](https://img.shields.io/docker/pulls/molu8bits/ansible-docker.svg)

## Ansible oneliners examples

### Check version

```bash
docker run -it --rm docker.io/molu8bits/ansible-docker:latest ansible --version
```

### Azure delete ResouceGroup

```bash
docker run -it --rm docker.io/molu8bits/ansible-docker:latest ansible localhost -m azure_rm_resourcegroup -a 'name=myResourceGroup location=eastus'

```

### Run playbook using user and password

```bash
cd galaxy-install-docker
docker run --rm -it -v ${PWD}:/ansible/run docker.io/molu8bits/ansible-docker:latest ansible-playbook -i inventory site.yml -u user1 --ask-pass --ask-become-pass
```

### Run playbook using ssh keys

```bash
cd galaxy-install-docker
docker run --rm -it -v ${HOME}/.ssh:/root/.ssh -v ${PWD}:/ansible/run docker.io/molu8bits/ansible-docker:latest ansible-playbook -i inventory site.yml
```

### Run with custom output log and command "ping"

```bash
docker run --rm -it -v ${PWD}:/ansible/run -e ANSIBLE_LOG_PATH=ansible-`date +%Y%m%d%H%M%S`.log docker.io/molu8bits/ansible-docker:latest ansible all, -i 192.168.2.1, -m ping -u user1 --ask-pass
```
