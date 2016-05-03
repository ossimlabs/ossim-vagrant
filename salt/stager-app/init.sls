include:
  - o2

install-stager-app:
  pkg.installed:
    - pkgs:
      - o2-stager-app

stager-app-config:
  file.managed:
    - name: /usr/share/omar/stager-app/stager-app.yml 
    - source: salt://stager-app/stager-app.yml
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - require:
      - pkg: install-stager-app

stager-app-shell:
  file.managed:
    - name: /usr/share/omar/stager-app/stager-app.sh
    - source: salt://o2/o2-app.sh
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - mode: 755
    - defaults:
      java_opts: "{{ salt['pillar.get']('ossim:stager-app:javaOpts')}}"
      program_name: stager-app
    - require:
      - pkg: install-stager-app

stager-app-dir-perms:
  file.directory:
    - name: /usr/share/omar/stager-app 
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - mode: 755    
    - recurse:
      - user
      - group
    - require:
      - pkg: install-stager-app

stager-app-service-wrapper:
  file.managed:
    - name: /etc/init.d/stager-app
    - mode: 755
    - template: jinja    
    - source: salt://o2/service-wrapper
    - defaults:
      program_name: stager-app
      program_user: "{{ salt['pillar.get']('ossim:user')}}"
      program_group: "{{ salt['pillar.get']('ossim:group')}}"
    - require:
      - pkg: install-stager-app
      - service: o2-app-iptables-running 

stager-app-service:
  service.running:
    - name: stager-app
    - enable: true
    - reload: false
    - watch:
      - file: stager-app-service-wrapper

