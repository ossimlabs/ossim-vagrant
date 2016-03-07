install-postgres:
  pkg.installed:
    - pkgs:
      - postgresql94
    - require:
      - pkgrepo: pgdg-94-centos

pgdg-94-centos:
  pkgrepo.managed:
    - humanname: pgdg-94-centos
    - baseurl: https://download.postgresql.org/pub/repos/yum/9.4/redhat/rhel-$releasever-$basearch
    - gpgcheck: 0
    - enabled: 1


