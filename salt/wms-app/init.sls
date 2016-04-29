install-wms-app:
  pkg.installed:
    - pkgs:
      - o2-wms-app

wms-app-dir-perms:
  file.directory:
    - name: /usr/share/omar/wms-app 
    - user: omar
    - group: omar
    - mode: 755    
    - recurse:
      - user
      - group
    - require:
      - pkg: install-wms-app

wms-app-shell:
  file.managed:
    - name: /usr/share/omar/wms-app/wms-app.sh
    - source: salt://o2/o2-app.sh
    - template: jinja
    - user: omar
    - group: omar
    - mode: 755
    - require:
      - pkg: install-wms-app

wms-app-shell-replace-block:
  file.blockreplace:
    - name: /usr/share/omar/wms-app/wms-app.sh
    - marker_start: "#MARKER_START salt managed do not remove"
    - marker_end: "#MARKER_END salt managed do not remove"
    - content: |
        APP_NAME=wms-app
        JAVA_OPTS="-server -Xms256m -Xmx2048m -Djava.awt.headless=true -XX:+CMSClassUnloadingEnabled -XX:+UseGCOverheadLimit"
    - require:
      - file: wms-app-shell



wms-app-service-wrapper:
  file.managed:
    - name: /etc/init.d/wms-app
    - mode: 755    
    - source: salt://o2/service-wrapper

# Setup service wrappers
# replace the contents between the marker 
# with the user and program name
#
wms-app-service-wrapper-replace-block:
  file.blockreplace:
    - name: /etc/init.d/wms-app
    - marker_start: "#MARKER_START salt managed do not remove"
    - marker_end: "#MARKER_END salt managed do not remove"
    - content: |
        PROG=wms-app
        PROG_USER="{{ salt['pillar.get']('ossim:user')}}"
        PROG_GROUP="{{ salt['pillar.get']('ossim:group')}}"
    - require:
      - pkg: install-wms-app
      - file: wms-app-service-wrapper
