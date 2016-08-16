install-jenkins:
  pkg.installed:
    - pkgs:
      - jenkins

install-dev:
  pkg.installed:
    - pkgs:
      - wget
      - gcc
      - gcc-c++
      - cmake
      - git
      - mkdocs
      - wget
      - curl
      - ant
      - nasm
      - maven
      - gpstk-devel
      - proj
      - proj-devel
      - proj-epsg
      - proj-nad
      - bzip2-devel
      - openjpeg2-devel
      - opencv-devel
      - hdf5a-devel
      - podofo-devel
      - geos-devel
      - libcurl-devel
      - libtiff-devel
      - libgeotiff-devel
      - giflib-devel
      - libpng-devel
      - freetype-devel
      - libjpeg-turbo-devel
      - gdal-devel
      - sqlite-devel
      - mesa-libGLU-devel
      - mesa-libGL-devel
      - mesa-libOSMesa-devel
      - OpenThreads-devel

jenkins-service:
  service.running:
    - name: jenkins
    - enable: true
    - reload: false
    - init_delay: 60
    - require:
      - pkg: install-jenkins
