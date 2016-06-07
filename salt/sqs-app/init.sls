{% set app_name = "sqs-app" %}
include:
  - o2

install-{{app_name}}:
  pkg.installed:
    - pkgs:
      - o2-{{app_name}}

install-credentials:
  file.managed:
    - name: /home/omar/.aws/credentials
    - source: salt://{{app_name}}/credentials
    - user: omar
    - group: omar
    - mode: 755
    - makedirs: True
    - template: jinja
    - defaults:
      key: {{ salt['pillar.get']('ossim:sqs-app:aws-access-key-id')}}
      secret: {{ salt['pillar.get']('ossim:sqs-app:aws-secret-access-key')}}
    - require:
      - pkg: install-{{app_name}}

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
      - file: install-credentials


