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
{% if not salt['file.directory_exists' ]('/etc/systemd') %}
      - service: o2-app-iptables-running 
{% else %}
      - firewalld: o2-app-firewalld
{% endif %}

wfs-app-service:
  service.running:
    - name: wfs-app
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: wfs-app-config
