{% if not salt['file.file_exists' ]('/etc/sysconfig/firewalld') %}
o2-app-firewall:
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

o2-app-firewall-running:
  service.running:
    - name: iptables
    - enable: True
    - reload: False
    - watch:
      - iptables: o2-app-firewall

{% else %}

o2-app-firewall-up:
  service.running:
    - name: firewalld
    - enable: True
    - reload: False

o2-app-firewall:
  firewalld.present:
    - name: public
#    - block_icmp:
#      - echo-reply
#      - echo-request
    - default: False
#    - masquerade: True
    - ports:
      - 8080/tcp
      - 80/tcp
    - require:
      - service: o2-app-firewall-up

o2-app-firewall-running:
  service.running:
    - name: firewalld
    - enable: True
    - reload: False
    - watch:
      - firewalld: o2-app-firewall

{% endif %}