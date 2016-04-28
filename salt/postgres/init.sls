install-postgres:
  pkg.installed:
    - pkgs:
      - postgresql95
      - postgresql95-server
      - postgis2_95 
    - require:
      - pkgrepo: pgdg-95-centos

pgdg-95-centos:
  pkgrepo.managed:
    - humanname: pgdg-95-centos
    - baseurl: https://download.postgresql.org/pub/repos/yum/9.5/redhat/rhel-$releasever-$basearch
    - gpgcheck: 0
    - enabled: 1

postgresql-first-run-init:
  cmd.run:
    - cwd: /
    - user: root
    - names:
      - service postgresql-9.5 initdb
    - unless: stat /var/lib/pgsql/9.5/data/postgresql.conf
    - require:
      - pkg: install-postgres

/var/lib/pgsql/9.5/data/pg_hba.conf:
  file.managed:
    - source: salt://postgres/pg_hba.conf
    - template: jinja
    - user: postgres
    - group: postgres
    - mode: 0600
    - require:
      - cmd: postgresql-first-run-init

/var/lib/pgsql/9.5/data/postgresql.conf:
  file.managed:
    - source: salt://postgres/postgresql.conf
    - template: jinja
    - user: postgres
    - group: postgres
    - mode: 0600
    - require:
      - cmd: postgresql-first-run-init

postgresql-9.5:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /var/lib/pgsql/9.5/data/pg_hba.conf
      - file: /var/lib/pgsql/9.5/data/postgresql.conf

postgresql-createdb:
  cmd.run:
    - cwd: /
    - user: root
    - names:
      - psql -U postgres -h {{ pillar['ossim']['database']['host'] }} -c 'create database "{{ pillar['ossim']['database']['name'] }}"'
    - unless: psql -h {{ pillar ['ossim']['database']['host'] }}  -U postgres -lqt | cut -d \| -f 1 | grep {{ pillar['ossim']['database']['name'] }}  
    - require:
      - pkg: install-postgres

postgresql-create-extension:
  cmd.run:
    - cwd: /
    - user: root
    - names:
      - psql -U postgres -h {{ pillar['ossim']['database']['host'] }} -c 'create extension postgis' -d {{ pillar['ossim']['database']['name'] }}
    - unless: psql -U postgres -h {{ pillar['ossim']['database']['host'] }} -c 'select count(*) from spatial_ref_sys' -d {{ pillar['ossim']['database']['name'] }}  
    - require:
      - cmd: postgresql-createdb


iptables-dead:
  service.dead:
    - name: iptables
    - enable: False
    - reload: False

