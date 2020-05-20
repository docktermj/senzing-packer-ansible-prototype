#!/usr/bin/env bash

# Commands for yum-based systems:  CentOS, Red Hat, etc.

if [ -n "$(command -v yum)" ]; then

  echo "YUM based"

# Commands for apt-based systems: Debian, Ubuntu, etc.

elif [ -n "$(command -v apt-get)" ]; then

    # Install Ansible repository.

    apt -y update && apt-get -y upgrade
    apt -y install software-properties-common
    apt-add-repository ppa:ansible/ansible

    # Install Ansible.

    apt -y update
    apt -y install ansible

fi
