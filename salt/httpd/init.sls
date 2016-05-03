install-httpd:
  pkg.installed:
    - pkgs:
      - httpd

install-proxy:
  file.managed:
    - name: /etc/httpd/conf.d/o2.conf
    - source: salt://httpd/o2.conf

httpd-iptables:
  iptables.insert:
    - position: 1
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 80
    - proto: tcp
    - save: True

httpd-iptables-running:
  service.running:
    - name: iptables
    - enable: true
    - reload: false
    - watch:
      - iptables: httpd-iptables

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

httpd-running:
  service.running:
    - name: httpd
    - enable: true
    - reload: false
    - watch:
      - file: install-proxy
      - pkg: install-httpd
      - service: httpd-iptables-running
