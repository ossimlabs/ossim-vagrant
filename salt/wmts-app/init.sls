include:
  - o2

install-wmts-app:
  pkg.installed:
    - pkgs:
      - o2-wmts-app

wmts-app-config:
  file.managed:
    - name: /usr/share/omar/wmts-app/wmts-app.yml 
    - source: salt://wmts-app/wmts-app.yml
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - require:
      - pkg: install-wmts-app

wmts-app-shell:
  file.managed:
    - name: /usr/share/omar/wmts-app/wmts-app.sh
    - source: salt://o2/o2-app.sh
    - template: jinja
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - mode: 755
    - defaults:
      java_opts: "-server -Xms256m -Xmx1024m -Djava.awt.headless=true -XX:+CMSClassUnloadingEnabled -XX:+UseGCOverheadLimit"
      program_name: wmts-app
    - require:
      - pkg: install-wmts-app

wmts-app-dir-perms:
  file.directory:
    - name: /usr/share/omar/wmts-app 
    - user: {{ salt['pillar.get']('ossim:user')}}
    - group: {{ salt['pillar.get']('ossim:group')}}
    - mode: 755    
    - recurse:
      - user
      - group
    - require:
      - pkg: install-wmts-app

wmts-app-service-wrapper:
  file.managed:
    - name: /etc/init.d/wmts-app
    - mode: 755
    - template: jinja    
    - source: salt://o2/service-wrapper
    - defaults:
      program_name: wmts-app
      program_user: "{{ salt['pillar.get']('ossim:user')}}"
      program_group: "{{ salt['pillar.get']('ossim:group')}}"
    - require:
      - pkg: install-wmts-app
      - service: o2-app-iptables-running 

wmts-app-service:
  service.running:
    - name: wmts-app
    - enable: true
    - reload: false
    - watch:
      - file: wmts-app-service-wrapper

