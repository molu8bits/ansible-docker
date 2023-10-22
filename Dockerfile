FROM ubuntu:22.04

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN  apt-get update; \
  apt-get install -y python3-pip wget curl libkrb5-dev language-pack-en; \
  apt-get install -y openssh-client sshpass; \
  mkdir -p /ansible/run; mkdir -p /etc/ansible; \
  apt-get upgrade -y; \
  rm -rf /var/lib/apt/lists/*

ADD --chown=root:root help.sh /ansible
ADD --chown=root:root ansible.cfg /etc/ansible/ansible.cfg

RUN chmod +x /ansible/help.sh

WORKDIR /ansible/run

#ENV ANSIBLE_HOST_KEY_CHECKING=false
#ENV ANSIBLE_LOG_PATH=ansible-output.log

RUN pip install --upgrade pip; \
    pip install idna==3.4; \
    pip install requests==2.31.0; \
    pip install --upgrade virtualenv==20.45.5; \
    pip install pywinrm[kerberos]==0.4.3; \
    pip install pywinrm==0.4.3; \
    pip install jmespath==1.0.1; \
    #pip install requests==2.22.0; \
    #pip install ansible==5.2.0 --user; \
    pip install ansible==8.5.0; \
    ansible-galaxy collection install azure.azcollection; \
    pip install -r /usr/local/lib/python3.10/dist-packages/ansible_collections/azure/azcollection/requirements-azure.txt; \
    ansible-galaxy collection install amazon.aws; \
    pip install -r ~/.usr/local/lib/python3.10/dist-packages/ansible_collections/amazon/aws/requirements.txt; \
    rm -rf /root/.cache/*

    # pip install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt; \

CMD /ansible/help.sh
