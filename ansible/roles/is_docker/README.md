Role Name
=========

A role to check is ansible is running in docker or not


Role Variables
--------------

ansible_facts.is_docker: bool

Dependencies
------------

no depedencies

Example Playbook
----------------

IF a role needs to know if it is running or no not inside a docker containers or in build context of a docker image, add is_docker as a dependence to ensure is_docker is played before role.

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
