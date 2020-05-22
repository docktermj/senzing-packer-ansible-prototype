Php PG Admin
=========

Installs phppgadmin on a server to interact with postgres. This is a demo setup.

Dependencies
------------

This role requires the following roles to be executed and installed:

- nginx
- postgres-11
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
     - phppgadmin
```


License
-------

[Apache 2](../../../LICENSE)
