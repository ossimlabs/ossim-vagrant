include:
  - o2

install-wfs-app:
  pkg.installed:
    - pkgs:
      - o2-wfs-app

wfs-app-config:
  file.managed:
    - name: /usr/share/omar/wfs-app/wfs-app.yml 
    - source: salt://wfs-app/wfs-app.yml
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - require:
      - pkg: install-wfs-app
      - service: o2-app-firewall-running 

wfs-app-service:
  service.running:
{% if not salt['file.file_exists' ]('/etc/sysconfig/firewalld') %}
    - name: wfs-app
{% else %}
    - name: wfs-app.service
{% endif %}
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: wfs-app-config
