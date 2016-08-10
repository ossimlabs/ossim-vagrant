install-jenkins:
  pkg.installed:
    - pkgs:
      - wget
      - tomcat
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
      - ossim-devel



install-war:
  file.managed:
    - name: /usr/share/tomcat/webapps/jenkins.war
    - source: https://updates.jenkins-ci.org/latest/jenkins.war
    - skip_verify: true
    - user: tomcat
    - group: tomcat
    - unless: stat /usr/share/tomcat/webapps/jenkins.war

tomcat-service:
  service.running:
    - name: tomcat.service
    - enable: true
    - reload: false
    - init_delay: 60
    - require:
      - file: install-war
