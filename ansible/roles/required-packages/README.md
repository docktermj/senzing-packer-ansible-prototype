Required Packages
=========

This role is used to ensure the required packages are installed on the system which are needed by the other roles execute correctly. This role mainly has logic for debian based systems.


Example Playbook
----------------

Including an example of how to use the role in a playbook:

```ansible
- hosts: servers
  roles:
     - required-packages
```

ToDo's
----------------

- Add logic for RHEL based systems


License
-------

[Apache 2](../../../LICENSE)
