{% set app_name = "jpip-server" %}
include:
  - o2

install-jpip:
  pkg.installed:
    - pkgs:
      - ossim-jpip-server
    - require:
      - pkgrepo: ossim-yum-repo

install-shell:
  file.managed:
    - name: /usr/share/omar/jpip-server/jpip-server.sh
    - source: salt://jpip-server/jpip-server.sh
    - user: omar
    - group: omar
    - mode: 755
    - makedirs: True
    - template: jinja
    - defaults:
      jpip_data_dir: {{ salt['pillar.get']('ossim:jpip-app:server:cache')}}
      jpip_sources: 20
      jpip_clients: 20
      jpip_port: 8080
      jpip_address: {{ salt['pillar.get']('ossim:jpip-app:server:ip')}}
      jpip_connection_threads: 40
    - require:
      - pkg: install-jpip

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
      - file: install-shell

