Senzing Entity Search Web App
=========

Thie role builds the senzing entity search web app. Then it installs it as a service on the machine.

Dependencies
------------

This role requires the following roles to be executed and installed:

- node
- postgres-11
- required-packages
- senzing-api-server
- senzing-g2
- senzing-postgres-config

Example Playbook
----------------

Including an example of how to use the role in a playbook:

```ansible
- hosts: servers
  roles:
     - senzing-entity-search-web-app
```

License
-------

[Apache 2](../../../LICENSE)
