FROM ubuntu:20.04

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN  apt-get update && apt-get upgrade -y; \
  apt-get install -y python3-pip wget curl libkrb5-dev; \
  apt-get install -y openssh-client sshpass; \
  mkdir -p /ansible/run; mkdir -p /etc/ansible; \
  rm -rf /var/lib/apt/lists/*

ADD --chown=root:root help.sh /ansible
ADD --chown=root:root ansible.cfg /etc/ansible/ansible.cfg

RUN chmod +x /ansible/help.sh

WORKDIR /ansible/run

#ENV ANSIBLE_HOST_KEY_CHECKING=false
#ENV ANSIBLE_LOG_PATH=ansible-output.log

RUN pip install --upgrade pip; \
    pip install idna==3.3; \
    pip install requests==2.27.1; \
    pip install --upgrade virtualenv==20.13; \
    pip install pywinrm[kerberos]==0.4.2; \
    pip install pywinrm==0.4.2; \
    pip install jmespath==0.10.0; \
    #pip install requests==2.22.0; \
    #pip install ansible==5.2.0 --user; \
    pip install ansible==5.2.0; \
    ansible-galaxy collection install azure.azcollection; \
    pip install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt; \
    rm -rf /root/.cache/*

CMD /ansible/help.sh
