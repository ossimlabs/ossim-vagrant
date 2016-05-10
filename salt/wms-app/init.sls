include:
  - o2

install-wms-app:
  pkg.installed:
    - pkgs:
      - o2-wms-app

wms-app-config:
  file.managed:
    - name: /usr/share/omar/wms-app/wms-app.yml 
    - source: salt://wms-app/wms-app.yml
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - require:
      - pkg: install-wms-app
{% if not salt['file.directory_exists' ]('/etc/systemd') %}
      - service: o2-app-iptables-running 
{% else %}
      - firewalld: o2-app-firewalld
{% endif %}

wms-app-service:
  service.running:
    - name: wms-app
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: wms-app-config

