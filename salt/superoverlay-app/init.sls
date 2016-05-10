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
{% if not salt['file.directory_exists' ]('/etc/systemd') %}
      - service: o2-app-iptables-running 
{% else %}
      - firewalld: o2-app-firewalld
{% endif %}

superoverlay-app-service:
  service.running:
    - name: superoverlay-app
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: superoverlay-app-config

