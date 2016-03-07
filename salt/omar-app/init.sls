install-omar-app:
  pkg.installed:
    - pkgs:
      - o2-omar-app
  file.directory:
    - name: /opt/ossimlabs
    - user: omar
    - group: omar
    - recurse:
      - user
      - group

/opt/ossimlabs/omar-app/omar-app.yml:
  file.managed:
    - source: salt://omar-app/omar-app.yml
    - template: jinja
    - user: omar
    - group: omar
    - require:
      - pkg: install-omar-app

