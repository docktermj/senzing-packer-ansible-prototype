Senzing API Server
=========

This role clone's the git repository senzing-api-server. Then it builds the senzing-api-server jar, and finally installs the jar as service. After the build process completes the senizng-api-server jar will be copied to /usr/bin and this is where the sysvinit expects the jar file when managing it as a service. The script [senzing-api-server](files/senzing-api-server) has all the logic to control the service and it is placed in /etc/init.d. Currently, this role on installs the jar as a service for debian based systems.

Dependencies
------------

This role requires the following roles to be executed and installed:

- java-8
- maven
- required-packages
- senzing-g2

Todo's
----------------

- Add logic for RHEL based systems

Example Playbook
----------------

```ansible
- hosts: servers
  roles:
     - senzing-api-server
```

License
-------

[Apache 2](../../../LICENSE)


