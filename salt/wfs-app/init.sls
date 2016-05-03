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

wfs-app-shell:
  file.managed:
    - name: /usr/share/omar/wfs-app/wfs-app.sh
    - source: salt://o2/o2-app.sh
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - mode: 755
    - defaults:
      java_opts: "{{ salt['pillar.get']('ossim:wfs-app:javaOpts')}}"
      program_name: wfs-app
    - require:
      - pkg: install-wfs-app

wfs-app-dir-perms:
  file.directory:
    - name: /usr/share/omar/wfs-app 
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - mode: 755    
    - recurse:
      - user
      - group
    - require:
      - pkg: install-wfs-app

wfs-app-service-wrapper:
  file.managed:
    - name: /etc/init.d/wfs-app
    - mode: 755
    - template: jinja    
    - source: salt://o2/service-wrapper
    - defaults:
      program_name: wfs-app
      program_user: "{{ salt['pillar.get']('ossim:user')}}"
      program_group: "{{ salt['pillar.get']('ossim:group')}}"
    - require:
      - pkg: install-wfs-app
      - service: o2-app-iptables-running 

wfs-app-service:
  service.running:
    - name: wfs-app
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: wfs-app-service-wrapper
      - file: wfs-app-config
