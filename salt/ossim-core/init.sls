include:
  - ossim-core.yum-repo

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
      - ossim-oms
    - require:
      - pkgrepo: ossim-yum-repo

