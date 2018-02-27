install-deps:
  pkg.installed:
    - pkgs:
      - gcc
      - gcc-c++
      - cmake
      - git
      - mkdocs
      - wget
      - curl
      - ant
      - swig
      - qt-devel
      - nasm
      - maven
      - gpstk-devel
      - OpenSceneGraph-devel
      - ffmpeg-devel
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
      - fftw-devel
      - libjpeg12-turbo-devel
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
      - qt5-qtbase-devel
      - aws-sdk-cpp-core-devel
      - aws-sdk-cpp-core
      - aws-sdk-cpp-s3
      - aws-sdk-cpp-s3-devel
      - jsoncpp-devel
      - opencv-devel

usr-local-permissions:
  file.directory:
    - name: /usr/local
    - user: vagrant
    - group: vagrant
    - recurse:
      - user
      - group

home-ossimlabs-permissions:
  file.directory:
    - name: /home/vagrant/ossimlabs
    - user: vagrant
    - group: vagrant
    - mode: 775
    - makedirs: True

ossim-preferences:
  file.managed:
    - name: /home/vagrant/ossimlabs/ossim-preferences
    - source: salt://dev-build/ossim-preferences
    - user: vagrant
    - group: vagrant
    - mode: 644
    - require:
      - file: home-ossimlabs-permissions

build-env-shell:
  file.managed:
    - name: /home/vagrant/ossimlabs/build-env.sh
    - source: salt://dev-build/build-env.sh
    - user: vagrant
    - group: vagrant
    - mode: 755
    - require:
      - file: home-ossimlabs-permissions

build-deps-shell:
  file.managed:
    - name: /home/vagrant/ossimlabs/build-deps.sh
    - source: salt://dev-build/build-deps.sh
    - user: vagrant
    - group: vagrant
    - mode: 755
    - require:
      - file: build-env-shell

build-ossim-shell:
  file.managed:
    - name: /home/vagrant/ossimlabs/build-ossim.sh
    - source: salt://dev-build/build-ossim.sh
    - user: vagrant
    - group: vagrant
    - mode: 755
    - require:
      - file: build-env-shell

checkout-ossim:
  git.latest:
    - name: https://github.com/ossimlabs/ossim.git
    - rev: dev
    - branch: dev
    # - force_checkout: true
    # - force_clone: true
    # - force_fetch: true
    # - force_reset: true
    - target: /home/vagrant/ossimlabs/ossim
    - user: vagrant
    - require:
      - pkg: install-deps
      - file: home-ossimlabs-permissions


checkout-omar:
  git.latest:
    - name: https://github.com/ossimlabs/omar.git
    - rev: dev
    - branch: dev
    # - force_checkout: true
    # - force_clone: true
    # - force_fetch: true
    # - force_reset: true
    - target: /home/vagrant/ossimlabs/omar
    - user: vagrant
    - require:
      - pkg: install-deps
      - file: home-ossimlabs-permissions

checkout-ossim-ci:
  git.latest:
    - name: https://github.com/ossimlabs/ossim-ci.git
    - rev: dev
    - branch: dev
    # - force_checkout: true
    # - force_clone: true
    # - force_fetch: true
    # - force_reset: true
    - target: /home/vagrant/ossimlabs/ossim-ci
    - user: vagrant
    - require:
      - pkg: install-deps
      - file: home-ossimlabs-permissions

checkout-ossim-gui:
  git.latest:
    - name: https://github.com/ossimlabs/ossim-gui.git
    - rev: dev
    - branch: dev
    - target: /home/vagrant/ossimlabs/ossim-gui
    - user: vagrant
    - require:
      - pkg: install-deps
      - file: home-ossimlabs-permissions

checkout-ossim-plugins:
  git.latest:
    - name: https://github.com/ossimlabs/ossim-plugins.git
    - rev: dev
    - branch: dev
    # - force_checkout: true
    # - force_clone: true
    # - force_fetch: true
    # - force_reset: true
    - target: /home/vagrant/ossimlabs/ossim-plugins
    - user: vagrant
    - require:
      - pkg: install-deps
      - file: home-ossimlabs-permissions

checkout-ossim-oms:
  git.latest:
    - name: https://github.com/ossimlabs/ossim-oms.git
    - rev: dev
    - branch: dev
    - target: /home/vagrant/ossimlabs/ossim-oms
    - user: vagrant
    - require:
      - pkg: install-deps
      - file: home-ossimlabs-permissions

checkout-ossim-video:
  git.latest:
    - name: https://github.com/ossimlabs/ossim-video.git
    - rev: dev
    - branch: dev
    # - force_checkout: true
    # - force_clone: true
    # - force_fetch: true
    # - force_reset: true
    - target: /home/vagrant/ossimlabs/ossim-video
    - user: vagrant
    - require:
      - pkg: install-deps
      - file: home-ossimlabs-permissions

checkout-ossim-planet:
  git.latest:
    - name: https://github.com/ossimlabs/ossim-planet.git
    - rev: dev
    - branch: dev
    # - force_checkout: true
    # - force_clone: true
    # - force_fetch: true
    # - force_reset: true
    - target: /home/vagrant/ossimlabs/ossim-planet
    - user: vagrant
    - require:
      - pkg: install-deps
      - file: home-ossimlabs-permissions

checkout-ossim-wms:
  git.latest:
    - name: https://github.com/ossimlabs/ossim-wms.git
    - rev: dev
    - branch: dev
    # - force_checkout: true
    # - force_clone: true
    # - force_fetch: true
    # - force_reset: true
    - target: /home/vagrant/ossimlabs/ossim-wms
    - user: vagrant
    - require:
      - pkg: install-deps
      - file: home-ossimlabs-permissions

checkout-open-scene-graph:
  git.latest:
    - name: https://github.com/openscenegraph/OpenSceneGraph.git
    - rev: OpenSceneGraph-3.2
    - branch: OpenSceneGraph-3.2
    - target: /home/vagrant/ossimlabs/OpenSceneGraph-3.2
    - user: vagrant
    # - force_checkout: true
    # - force_clone: true
    # - force_fetch: true
    # - force_reset: true
    - require:
      - pkg: install-deps
      - file: home-ossimlabs-permissions

checkout-ffmpeg:
  git.latest:
    - name: https://github.com/FFmpeg/FFmpeg.git
    - rev: release/3.0
    - branch: release/3.0
    - target: //home/vagrant/ossimlabs/ffmpeg-3.0
    - user: vagrant
    - require:
      - pkg: install-deps
      - file: home-ossimlabs-permissions
