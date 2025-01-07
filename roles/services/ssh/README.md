Role Name
=========

A basic configuration to setup SSH server, config file, and copy over keys.

Requirements
------------

When running this role with ansible_playbook, you will need to use the option
'-k' to prompt for the password to connect to the remote host. This is because
the SSH server is not yet configured.

Role Variables
--------------

Must set the following variables in the host_vars file for the host you are

This is the public key that will be copied to the remote host.

```yaml
ssh_public_key: |
  ssh-ed25519 XXX hostname

# These are flags that will be used to determine if the configuration file or
# public key should be copied to the remote host.

ssh_config_flag: true
ssh_public_key_flag: true
```

Dependencies
------------

N/A

Example Playbook
----------------

Example of how to use the role.

```yaml
- name: Install and configure SSH
  hosts: hostname
  become: true
  roles:
    - role: ssh
```

License
-------

MIT

Author Information
------------------

John Nelson
