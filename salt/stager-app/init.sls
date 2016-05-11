include:
  - o2

install-stager-app:
  pkg.installed:
    - pkgs:
      - o2-stager-app

stager-app-config:
  file.managed:
    - name: /usr/share/omar/stager-app/stager-app.yml 
    - source: salt://stager-app/stager-app.yml
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - require:
      - pkg: install-stager-app
      - service: o2-app-firewall-running 

stager-app-service:
  service.running:
{% if not salt['file.file_exists' ]('/etc/sysconfig/firewalld') %}
    - name: stager-app
{% else %}
    - name: stager-app.service
{% endif %}
    - enable: true

    - reload: false
    - init_delay: 60
    - watch:
      - file: stager-app-config

