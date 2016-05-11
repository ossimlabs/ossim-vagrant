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
      - service: o2-app-firewall-running 

wms-app-service:
  service.running:
{% if not salt['file.file_exists' ]('/etc/sysconfig/firewalld') %}
    - name: wms-app
{% else %}
    - name: wms-app.service
{% endif %}
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: wms-app-config

