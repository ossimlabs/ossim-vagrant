install-wmts-app:
  pkg.installed:
    - pkgs:
      - o2-wmts-app

wmts-app-config:
  file.managed:
    - name: /usr/share/omar/wmts-app/wmts-app.yml 
    - source: salt://wmts-app/wmts-app.yml
    - template: jinja
    - user: omar
    - group: omar
    - require:
      - pkg: install-wmts-app

wmts-app-shell:
  file.managed:
    - name: /usr/share/omar/wmts-app/wmts-app.sh
    - source: salt://wmts-app/wmts-app.sh
    - template: jinja
    - user: omar
    - group: omar
    - mode: 755
    - require:
      - pkg: install-wmts-app

wmts-app-dir-perms:
  file.directory:
    - name: /usr/share/omar/wmts-app 
    - user: omar
    - group: omar
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
    - source: salt://o2/service-wrapper

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
        PROG_USER="omar"
        PROG_GROUP="omar"
    - require:
      - pkg: install-wmts-app
      - file: wmts-app-service-wrapper

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

wmts-app-iptables-dead:
  service.dead:
    - name: iptables
    - require:
      - iptables: wmts-app-iptables

wmts-app-iptables-running:
  service.running:
    - name: iptables
    - enable: true
    - reload: true
    - require:
      - service: wmts-app-iptables-dead

wmts-app-service:
  service.running:
    - name: wmts-app
    - enable: true
    - reload: true
    - require:
      - service: wmts-app-iptables-running
      - file: wmts-app-service-wrapper-replace-block

