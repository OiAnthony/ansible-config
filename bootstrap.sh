#!/bin/bash
# Bootstrap script for setting up a new development environment

set -euo pipefail

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   echo "This script should not be run as root" 
   exit 1
fi

# Install Ansible if not present
if ! command -v ansible &> /dev/null; then
    echo "Installing Ansible..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt update
        sudo apt install -y software-properties-common
        sudo add-apt-repository --yes --update ppa:ansible/ansible
        sudo apt install -y ansible
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install ansible
    else
        echo "Unsupported OS: $OSTYPE"
        exit 1
    fi
fi

# Install Ansible Galaxy requirements
echo "Installing Ansible Galaxy requirements..."
ansible-galaxy install -r requirements.yml

# Run the playbook
echo "Running Ansible playbook..."
ansible-playbook playbook.yml --ask-become-pass

echo "Bootstrap complete!"
