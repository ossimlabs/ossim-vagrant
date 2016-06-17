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
      - qt-devel
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

usr-local-permissions:
  file.directory:
    - name: /usr/local
    - user: vagrant
    - group: vagrant
    - recurse:
      - user
      - group

ossim-preferences:
  file.managed:
    - name: /home/vagrant/ossim-preferences
    - source: salt://dev-build/ossim-preferences
    - user: vagrant
    - group: vagrant
    - mode: 644

build-env-shell:
  file.managed:
    - name: /home/vagrant/build-env.sh
    - source: salt://dev-build/build-env.sh
    - user: vagrant
    - group: vagrant
    - mode: 755

build-deps-shell:
  file.managed:
    - name: /home/vagrant/build-deps.sh
    - source: salt://dev-build/build-deps.sh
    - user: vagrant
    - group: vagrant
    - mode: 755
    - require:
      - file: build-env-shell

build-ossim-shell:
  file.managed:
    - name: /home/vagrant/build-ossim.sh
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
    - target: /home/vagrant/ossim
    - user: vagrant
    - require:
      - pkg: install-deps

checkout-ossim-gui:
  git.latest:
    - name: https://github.com/ossimlabs/ossim-gui.git
    - rev: dev
    - branch: dev
    - target: /home/vagrant/ossim-gui
    - user: vagrant
    - require:
      - pkg: install-deps

checkout-omar:
  git.latest:
    - name: https://github.com/ossimlabs/omar.git
    - rev: dev
    - branch: dev
    # - force_checkout: true
    # - force_clone: true
    # - force_fetch: true
    # - force_reset: true
    - target: /home/vagrant/omar
    - user: vagrant
    - require:
      - pkg: install-deps

checkout-oms:
  git.latest:
    - name: https://github.com/ossimlabs/ossim-oms.git
    - rev: dev
    - branch: dev
    # - force_checkout: true
    # - force_clone: true
    # - force_fetch: true
    # - force_reset: true
    - target: /home/vagrant/ossim-oms
    - user: vagrant
    - require:
      - pkg: install-deps

checkout-ossim-plugins:
  git.latest:
    - name: https://github.com/ossimlabs/ossim-plugins.git
    - rev: dev
    - branch: dev
    # - force_checkout: true
    # - force_clone: true
    # - force_fetch: true
    # - force_reset: true
    - target: /home/vagrant/ossim-plugins
    - user: vagrant
    - require:
      - pkg: install-deps

checkout-ossim-oms:
  git.latest:
    - name: https://github.com/ossimlabs/ossim-oms.git
    - rev: dev
    - branch: dev
    - target: /home/vagrant/ossim-oms
    - user: vagrant
    - require:
      - pkg: install-deps

checkout-ossim-video:
  git.latest:
    - name: https://github.com/ossimlabs/ossim-video.git
    - rev: dev
    - branch: dev
    # - force_checkout: true
    # - force_clone: true
    # - force_fetch: true
    # - force_reset: true
    - target: /home/vagrant/ossim-video
    - user: vagrant
    - require:
      - pkg: install-deps

checkout-ossim-planet:
  git.latest:
    - name: https://github.com/ossimlabs/ossim-planet.git
    - rev: dev
    - branch: dev
    # - force_checkout: true
    # - force_clone: true
    # - force_fetch: true
    # - force_reset: true
    - target: /home/vagrant/ossim-planet
    - user: vagrant
    - require:
      - pkg: install-deps

checkout-ossim-wms:
  git.latest:
    - name: https://github.com/ossimlabs/ossim-wms.git
    - rev: dev
    - branch: dev
    # - force_checkout: true
    # - force_clone: true
    # - force_fetch: true
    # - force_reset: true
    - target: /home/vagrant/ossim-wms
    - user: vagrant
    - require:
      - pkg: install-deps

checkout-ossim-open-scene-graph:
  git.latest:
    - name: https://github.com/openscenegraph/OpenSceneGraph.git
    - rev: OpenSceneGraph-3.2
    - branch: OpenSceneGraph-3.2
    - target: /home/vagrant/OpenSceneGraph-3.2
    - user: vagrant
    # - force_checkout: true
    # - force_clone: true
    # - force_fetch: true
    # - force_reset: true
    - require:
      - pkg: install-deps

checkout-ffmpeg:
  git.latest:
    - name: https://github.com/FFmpeg/FFmpeg.git
    - rev: release/3.0
    - branch: release/3.0
    - target: /home/vagrant/ffmpeg-3.0
    - user: vagrant
    - require:
      - pkg: install-deps
