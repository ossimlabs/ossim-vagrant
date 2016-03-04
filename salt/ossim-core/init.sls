intall-ossim-core:
  pkg.installed:
    - pkgs:
      - ossim
      - ossim-kakadu-plugin
      - ossim-gdal-plugin
      - ossim-hdf5-plugin
      - ossim-geopdf-plugin
      - ossim-cnes-plugin
      - ossim-sqlite-plugin
      - ossim-png-plugin
      - ossim-opencv-plugin
      - ossim-web-plugin
    - require:
      - pkgrepo: ossim-yum-repo

ossim-yum-repo:
  pkgrepo.managed:
    - humanname: OSSIM-Yum-Repo
    - baseurl: {{ pillar['ossim']['yum_repo'] }}/CentOS/6/dev/x86_64
    - gpgcheck: 0
