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
{% if not salt['file.directory_exists' ]('/etc/systemd') %}
      - service: o2-app-iptables-running 
{% else %}
      - firewalld: o2-app-firewalld
{% endif %}

stager-app-service:
  service.running:
    - name: stager-app
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: stager-app-config

