include:
  - o2

install-wms-app:
  pkg.installed:
    - pkgs:
      - o2-wms-app

wms-app-config:
  file.managed:
    - name: /usr/share/omar/wms-app/wms-app.yml 
    - source: salt://wms-app/wms-app.yml
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - require:
      - pkg: install-wms-app

wms-app-shell:
  file.managed:
    - name: /usr/share/omar/wms-app/wms-app.sh
    - source: salt://o2/o2-app.sh
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - mode: 755
    - defaults:
      java_opts: "{{ salt['pillar.get']('ossim:wms-app:javaOpts')}}"
      program_name: wms-app
    - require:
      - pkg: install-wms-app

wms-app-dir-perms:
  file.directory:
    - name: /usr/share/omar/wms-app 
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - mode: 755    
    - recurse:
      - user
      - group
    - require:
      - pkg: install-wms-app

wms-app-service-wrapper:
  file.managed:
    - name: /etc/init.d/wms-app
    - mode: 755
    - template: jinja    
    - source: salt://o2/service-wrapper
    - defaults:
      program_name: wms-app
      program_user: "{{ salt['pillar.get']('ossim:user')}}"
      program_group: "{{ salt['pillar.get']('ossim:group')}}"
    - require:
      - pkg: install-wms-app
      - service: o2-app-iptables-running 

wms-app-service:
  service.running:
    - name: wms-app
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: wms-app-service-wrapper
      - file: wms-app-config

