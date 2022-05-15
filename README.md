Ansible Role for Netplan
========================

An Ansible role that configures networking with [Netplan][Home].

[Home]: https://netplan.io/

Requirements
------------

None.

Role Variables
--------------

The `netplan_ethernets` variable contains definitions of Ethernet devices. Its
value has the same structure as the `ethernet:` node of a Netplan configuration
file. See [Netplan reference][Reference] for details. The following subset of
device properties is supported:

- `dhcp4`
- `addresses` (sequence of `addr/prefixlen` strings only)
- `routes` (`to` and `via` parameters only)
- `nameservers` (`addresses` parameter only)

[Reference]: https://netplan.io/reference/

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
        netplan_ethernets:
          eth0:
            addresses:
              - 192.168.0.10/24
            routes:
              - to: 0.0.0.0/0
                via: 192.168.0.1
            nameservers:
              addresses:
                - 10.10.10.10
```

License
-------

MIT

Author Information
------------------

Alexey Busygin \<yaabusygin@gmail.com\>
