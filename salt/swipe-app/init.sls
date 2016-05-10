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
{% if not salt['file.directory_exists' ]('/etc/systemd') %}
      - service: o2-app-iptables-running 
{% else %}
      - firewalld: o2-app-firewalld
{% endif %}


swipe-app-service:
  service.running:
    - name: swipe-app
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: swipe-app-config
