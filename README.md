# Ansible inside docker

## Build image

```sh
docker build -t docker.io/molu8bits/ansible-docker:v0.0.1 .
```

## Ansible oneliners examples

### Azure delete ResouceGroup

```bash
ansible localhost -m azure_rm_resourcegroup -a 'name=myResourceGroup location=eastus'
docker run -it --rm ansible --version
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
