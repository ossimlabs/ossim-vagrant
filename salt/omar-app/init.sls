include:
  - o2

install-omar-app:
  pkg.installed:
    - pkgs:
      - o2-omar-app

omar-app-config:
  file.managed:
    - name: /usr/share/omar/omar-app/omar-app.yml 
    - source: salt://omar-app/omar-app.yml
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - require:
      - pkg: install-omar-app

omar-app-shell:
  file.managed:
    - name: /usr/share/omar/omar-app/omar-app.sh
    - source: salt://o2/o2-app.sh
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - mode: 755
    - defaults:
      java_opts: "-server -Xms256m -Xmx1024m -Djava.awt.headless=true -XX:+CMSClassUnloadingEnabled -XX:+UseGCOverheadLimit"
      program_name: omar-app
    - require:
      - pkg: install-omar-app

omar-app-dir-perms:
  file.directory:
    - name: /usr/share/omar/omar-app 
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - mode: 755    
    - recurse:
      - user
      - group
    - require:
      - pkg: install-omar-app

omar-app-service-wrapper:
  file.managed:
    - name: /etc/init.d/omar-app
    - mode: 755
    - template: jinja    
    - source: salt://o2/service-wrapper
    - defaults:
      program_name: omar-app
      program_user: "{{ salt['pillar.get']('ossim:user')}}"
      program_group: "{{ salt['pillar.get']('ossim:group')}}"
    - require:
      - pkg: install-omar-app
      - service: o2-app-iptables-running 

omar-app-service:
  service.running:
    - name: omar-app
    - enable: true
    - reload: false
    - init_delay: 60
    - watch:
      - file: omar-app-service-wrapper
      - file: omar-app-config

