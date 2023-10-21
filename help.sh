#!/bin/bash

echo "run ansible command e.g:"
echo "1. Single command:"
echo "docker run --rm -it molu8bits/ansible-docker:latest ansible all, -i 192.168.2.1, -m ping -u user1 --ask-pass --ask-become-pass"
echo "2. Run playbook site.yml from local directory and use user's SSH keys"
echo "docker run --rm -it -v ${HOME}/.ssh:/root/.ssh -v ${PWD}:/ansible/run molu8bits/ansible-docker:latest ansible-playbook -i inventory site.yml"
echo "3. Save Ansible output to file:"
echo "ANSIBLE_LOG_PATH=ansible-`date +%Y%m%d%H%M%S`.log docker run --rm -it -v ${PWD}:/ansible/run molu8bits/ansible-docker:latest ansible-playbook -i inventory site.yml -u user1 --ask-pass --ask-become-pass"
