include:
  - firewall

policycoreutils-python:
  pkg.installed

policycoreutils:
  pkg.installed

selinux_mode:
  selinux.mode:
    - name: permissive
    - require:
      - pkg: policycoreutils
      - pkg: policycoreutils-python

httpd_can_network_connect:
  selinux.boolean:
    - value: True
    - persist: True
    - require:
      - selinux: selinux_mode
