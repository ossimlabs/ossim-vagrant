
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


o2-app-iptables:
  iptables.insert:
    - position: 1
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 8080
    - proto: tcp
    - save: True

o2-app-iptables-running:
  service.running:
    - name: iptables
    - enable: true
    - reload: false
    - watch:
      - iptables: o2-app-iptables
