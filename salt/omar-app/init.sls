include:
  - o2

install-omar-app:
  pkg.installed:
    - pkgs:
      - o2-omar-app

omar-app-config:
  file.managed:
    - name: /usr/share/omar/omar-app/omar-app.yml 
    - source: salt://omar-app/omar-app.yml
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - require:
      - pkg: install-omar-app
      - service: o2-app-firewall-running 

omar-app-service:
  service.running:
    - name: omar-app
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: omar-app-config

