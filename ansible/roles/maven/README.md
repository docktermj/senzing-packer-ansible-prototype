Maven
=========

This role installs maven. Currently, the logic is for debian based systems. Future, release will include logic for RHEL based systems.

Dependencies
------------

Requires these roles:

- required-packages
- java-8

Todo's
----------------

- Add logic for RHEL based systems

Example Playbook
----------------

Including an example of how to use the role in a playbook:

```ansible
- hosts: servers
  roles:
     - maven
```


License
-------

[Apache 2](../../../LICENSE)
