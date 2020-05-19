Java 8
=========

This role install's java 8 from a JFrog artifactory called [AdoptOpenJDK](https://adoptopenjdk.net/installation.html#linux-pkg). It will install java 8 for both Debian based and RHEL based systems. 

Dependencies
------------

Roles required to be executed before this role:

- required-packages

Example Playbook
----------------

Including an example of how to use the role in a playbook:

```ansible
- hosts: servers
  roles:
     - java-8
```


License
-------

[Apache 2](../../../LICENSE)