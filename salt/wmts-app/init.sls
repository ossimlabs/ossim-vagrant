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
    - require:
      - pkg: install-wmts-app

wmts-app-shell-replace-block:
  file.blockreplace:
    - name: /usr/share/omar/wmts-app/wmts-app.sh
    - marker_start: "#MARKER_START salt managed do not remove"
    - marker_end: "#MARKER_END salt managed do not remove"
    - content: |
        APP_NAME=wmts-app
        JAVA_OPTS="-server -Xms256m -Xmx1024m -Djava.awt.headless=true -XX:+CMSClassUnloadingEnabled -XX:+UseGCOverheadLimit"
    - require:
      - file: wmts-app-shell

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


wmts-app-iptables:
  iptables.insert:
    - position: 1
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 8080
    - proto: tcp
    - save: True

wmts-app-iptables-running:
  service.running:
    - name: iptables
    - enable: true
    - reload: false
    - watch:
      - iptables: wmts-app-iptables

wmts-app-service-wrapper:
  file.managed:
    - name: /etc/init.d/wmts-app
    - mode: 755    
    - source: salt://o2/service-wrapper
    - require:
      - service: wmts-app-iptables-running 

# Setup service wrappers
# replace the contents between the marker 
# with the user and program name
#
wmts-app-service-wrapper-replace-block:
  file.blockreplace:
    - name: /etc/init.d/wmts-app
    - marker_start: "#MARKER_START salt managed do not remove"
    - marker_end: "#MARKER_END salt managed do not remove"
    - content: |
        PROG=wmts-app
        PROG_USER="{{ salt['pillar.get']('ossim:user')}}"
        PROG_GROUP="{{ salt['pillar.get']('ossim:group')}}"
    - require:
      - pkg: install-wmts-app
      - file: wmts-app-service-wrapper

wmts-app-service:
  service.running:
    - name: wmts-app
    - enable: true
    - reload: false
    - watch:
      - file: wmts-app-service-wrapper-replace-block

