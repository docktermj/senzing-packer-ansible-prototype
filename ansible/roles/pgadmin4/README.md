pgAdmin4
=========

This role installs pgAdmin4 with a demo setup on the vm.

Dependencies
------------

This role requires the following roles to be executed and installed:

- nginx
- postgres-11
- python3
- required-packages

Todo's
----------------

- Add logic for RHEL based systems

Example Playbook
----------------

Including an example of how to use the role in a playbook:

```ansible
- hosts: servers
  roles:
     - pgadmin4
```

License
-------

[Apache 2](../../../LICENSE)
