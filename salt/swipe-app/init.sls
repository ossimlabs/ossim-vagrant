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

swipe-app-shell:
  file.managed:
    - name: /usr/share/omar/swipe-app/swipe-app.sh
    - source: salt://o2/o2-app.sh
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - mode: 755
    - defaults:
      java_opts: "{{ salt['pillar.get']('ossim:swipe-app:javaOpts')}}"
      program_name: swipe-app
    - require:
      - pkg: install-swipe-app

swipe-app-dir-perms:
  file.directory:
    - name: /usr/share/omar/swipe-app 
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - mode: 755    
    - recurse:
      - user
      - group
    - require:
      - pkg: install-swipe-app

swipe-app-service-wrapper:
  file.managed:
    - name: /etc/init.d/swipe-app
    - mode: 755
    - template: jinja    
    - source: salt://o2/service-wrapper
    - defaults:
      program_name: swipe-app
      program_user: "{{ salt['pillar.get']('ossim:user')}}"
      program_group: "{{ salt['pillar.get']('ossim:group')}}"
    - require:
      - pkg: install-swipe-app
      - service: o2-app-iptables-running 

swipe-app-service:
  service.running:
    - name: swipe-app
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: swipe-app-service-wrapper
      - file: swipe-app-config
