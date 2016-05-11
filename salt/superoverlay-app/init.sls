include:
  - o2

install-superoverlay-app:
  pkg.installed:
    - pkgs:
      - o2-superoverlay-app

superoverlay-app-config:
  file.managed:
    - name: /usr/share/omar/superoverlay-app/superoverlay-app.yml 
    - source: salt://superoverlay-app/superoverlay-app.yml
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - require:
      - pkg: install-superoverlay-app
      - service: o2-app-firewall-running 

superoverlay-app-service:
  service.running:
{% if not salt['file.file_exists' ]('/etc/sysconfig/firewalld') %}
    - name: superoverlay-app
{% else %}
    - name: superoverlay-app.service
{% endif %}
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: superoverlay-app-config

