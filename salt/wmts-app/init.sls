include:
  - o2.firewall

install-wmts-app:
  pkg.installed:
    - pkgs:
      - o2-wmts-app

wmts-app-config:
  file.managed:
    - name: /usr/share/omar/wmts-app/wmts-app.yml 
    - source: salt://wmts-app/wmts-app.yml
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - require:
      - pkg: install-wmts-app
      - service: o2-app-firewall-running 

wmts-app-service:
  service.running:
    - name: wmts-app.service
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: wmts-app-config

