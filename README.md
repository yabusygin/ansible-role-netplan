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
This file will be uploaded and applied to managed node. Mandatory.

`netplan_networkd_enable` -- enable systemd-networkd service
(default value: `no`).

`netplan_resolved_enable` -- enable systemd-resolved service
(default value: `no`).

`netplan_installer_disable` -- remove Netplan and Cloud-init configuration files
generated by Subiquity installer (default value: `no`).

`netplan_cloudinit_disable` -- disable Cloud-init network configuration and
remove Netplan configuration generated by Cloud-init (default value: `no`).

`netplan_ifupdown_disable` -- disable "ifupdown" network management system
(default value: `no`).

`netplan_ifupdown_reset_interfaces` -- reset `/etc/network/interfaces`
(default value: `no`). Leave loopback interface only. A backup of original
content is preserved.

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
        netplan_installer_disable: yes
        netplan_cloudinit_disable: yes
        netplan_networkd_enable: yes
        netplan_resolved_enable: yes
        netplan_ifupdown_disable: yes
        netplan_ifupdown_reset_interfaces: yes
```

License
-------

MIT

Author Information
------------------

Alexey Busygin \<yaabusygin@gmail.com\>
