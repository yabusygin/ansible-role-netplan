Ansible Role for Netplan
========================

An Ansible role that configures networking with [Netplan][Home].

[Home]: https://netplan.io/

Requirements
------------

None.

Role Variables
--------------

`netplan_config` specifies path to Netplan configuration file on control node.
This file will be uploaded and applied to managed node.

Dependencies
------------

None.

Example Playbook
----------------

```yaml
---
- name: example playbook
  hosts: server
  tasks:
    - name: configure networking
      ansible.builtin.import_role:
        name: netplan
      vars:
        netplan_config: config/netplan.yml
        netplan_cloudinit_disable: yes
```

License
-------

MIT

Author Information
------------------

Alexey Busygin \<yaabusygin@gmail.com\>
