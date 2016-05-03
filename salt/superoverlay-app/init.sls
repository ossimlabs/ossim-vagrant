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

superoverlay-app-shell:
  file.managed:
    - name: /usr/share/omar/superoverlay-app/superoverlay-app.sh
    - source: salt://o2/o2-app.sh
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - mode: 755
    - defaults:
      java_opts: "{{ salt['pillar.get']('ossim:superoverlay-app:javaOpts')}}"
      program_name: superoverlay-app
    - require:
      - pkg: install-superoverlay-app

superoverlay-app-dir-perms:
  file.directory:
    - name: /usr/share/omar/superoverlay-app 
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - mode: 755    
    - recurse:
      - user
      - group
    - require:
      - pkg: install-superoverlay-app

superoverlay-app-service-wrapper:
  file.managed:
    - name: /etc/init.d/superoverlay-app
    - mode: 755
    - template: jinja    
    - source: salt://o2/service-wrapper
    - defaults:
      program_name: superoverlay-app
      program_user: "{{ salt['pillar.get']('ossim:user')}}"
      program_group: "{{ salt['pillar.get']('ossim:group')}}"
    - require:
      - pkg: install-superoverlay-app
      - service: o2-app-iptables-running 

superoverlay-app-service:
  service.running:
    - name: superoverlay-app
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: superoverlay-app-service-wrapper
      - file: superoverlay-app-config

