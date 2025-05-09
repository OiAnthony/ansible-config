# Ansible Development Environment Setup

This project automates the setup of a consistent development environment across multiple machines using Ansible.

## Prerequisites

- **Operating System**: macOS or Linux (Ubuntu/Debian recommended)
- **Base Software**:
  - Git (for cloning the repository)
  - Python 3.6+ and pip (for running Ansible)
  - curl (for downloading components)
- **Permissions**:
  - Sudo access (for package installation)
  - Write permissions to home directory

## Features

- Standardized development environment configuration
- Cross-platform support (Linux/macOS)
- Modular role-based organization
- Development tools include:
  - Python environment with PDM package manager (installed via official script)
  - Docker Engine and Docker Compose (using Aliyun mirror source)
  - Node.js with Volta version manager
  - zsh with Oh My Zsh
- China mainland optimized with domestic mirrors:
  - Aliyun mirror for Docker APT repository and installation
  - Multiple Docker registry mirrors configured (163, USTC, Baidu, Docker-CN)
  - TUNA mirror for Python packages

## Usage

1. Clone this repository
2. Run `chmod +x bootstrap.sh`
3. Execute `./bootstrap.sh`
4. For verbose debugging, run: `ansible-playbook playbook.yml -vvv`

## Configuring `inventory.ini`

The `inventory.ini` file defines the hosts and groups managed by Ansible. Here's how to configure it:

1. **Local Host**: By default, the file includes a `[local]` group for testing on the local machine:

   ```ini
   [local]
   localhost ansible_connection=local
   ```

2. **Development/Production Groups**: Uncomment and modify the `[development]` or `[production]` sections to add your servers:

   ```ini
   [development]
   dev-server1 ansible_host=192.168.1.100
   dev-server2 ansible_host=192.168.1.101
   ```

3. **Global Variables**: The `[all:vars]` section sets default variables for all hosts:

   ```ini
   [all:vars]
   ansible_python_interpreter=/usr/bin/python3
   ansible_ssh_private_key_file=~/.ssh/id_rsa
   ```

4. **Customization**: Replace placeholder values (e.g., IPs, usernames, paths) with your actual environment details.

For more details, refer to the [Ansible Inventory Documentation](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html).
