include:
  - o2

install-swipe-app:
  pkg.installed:
    - pkgs:
      - o2-swipe-app

swipe-app-config:
  file.managed:
    - name: /usr/share/omar/swipe-app/swipe-app.yml 
    - source: salt://swipe-app/swipe-app.yml
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - require:
      - pkg: install-swipe-app
      - service: o2-app-firewall-running 

swipe-app-service:
  service.running:
{% if not salt['file.file_exists' ]('/etc/sysconfig/firewalld') %}
    - name: swipe-app
{% else %}
    - name: swipe-app.service
{% endif %}
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: swipe-app-config
