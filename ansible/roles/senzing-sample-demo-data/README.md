Senzing Sample Demo Data
=========

This role shunt's Senzing's sample demo data into the database system.

Dependencies
------------

This role requires the following roles to be executed and installed:

- python3
- postgres-11
- required-packages
- senzing-g2
- senzing-postgres-config

Example Playbook
----------------

Including an example of how to use the role in a playbook:

```ansible
- hosts: servers
  roles:
     - senzing-sample-demo-data
```

License
-------

[Apache 2](../../../LICENSE)
