install-httpd:
  pkg.installed:
    - pkgs:
      - httpd
      - mod_ssl

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

nano:
  pkg.installed

setup-ssl-conf:
  file.managed:
    - name: /etc/httpd/conf.d/ssl.conf
    - source: salt://httpd/ssl.conf

setup-httpd-conf:
  file.managed:
    - name: /etc/httpd/conf/httpd.conf
    - source: salt://httpd/httpd.conf

copy-oc2s-cert:
  file.managed:
    - name: /etc/pki/tls/certs/oc2s.pem
    - source: salt://httpd/oc2s.pem

copy-oc2s-priv-key:
  file.managed:
    - name: /etc/pki/tls/private/oc2s.key
    - source: salt://httpd/oc2s.key

copy-oc2s-cert-req:
  file.managed:
    - name: /etc/pki/tls/private/oc2s.csr
    - source: salt://httpd/oc2s.csr

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
      - file: setup-ssl-conf
      - file: setup-httpd-conf
      - file: copy-oc2s-cert
      - file: copy-oc2s-priv-key
      - file: copy-oc2s-cert-req