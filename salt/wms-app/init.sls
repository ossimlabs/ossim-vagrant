install-wms-app:
  pkg.installed:
    - pkgs:
      - o2-wms-app

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
      - pkg: install-wms-app

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
