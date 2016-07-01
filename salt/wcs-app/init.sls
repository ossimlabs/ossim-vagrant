{% set app_name = "wcs-app" %}
include:
  - o2

install-{{app_name}}:
  pkg.installed:
    - pkgs:
      - o2-{{app_name}}

{{app_name}}-config:
  file.managed:
    - name: /usr/share/omar/{{app_name}}/{{app_name}}.yml 
    - source: salt://{{app_name}}/{{app_name}}.yml
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - require:
      - pkg: install-{{app_name}}
      - service: o2-app-firewall-running 

{{app_name}}-service:
  service.running:
{% if not salt['file.file_exists' ]('/etc/sysconfig/firewalld') %}
    - name: {{app_name}}
{% else %}
    - name: {{app_name}}.service
{% endif %}
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: {{app_name}}-config

