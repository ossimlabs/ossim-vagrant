file_roots:
    base:
      - /srv/salt/
      - /srv/formulas/jenkins-formula
base:
  'postgres.local':
    - postgres
  'httpd.local':
    - httpd
  '*-app.local':
    - java
    - ossim-core.yum-repo
  'jenkins*.local':
    - java
    - ossim-core.yum-repo
#    - jenkins-setup.yum-repo
  'sqs-app.local':
    - sqs-app
  'avro-app.local':
    - avro-app
  'wmts-app.local':
    - wmts-app
  'wms-app.local':
    - ossim-core
    - wms-app
  'wcs-app.local':
    - ossim-core
    - wcs-app
  'wfs-app.local':
    - ossim-core
    - wfs-app
  'download-app.local':
    - download-app
  'superoverlay-app.local':
    - ossim-core
    - superoverlay-app
  'stager-app.local':
    - ossim-core
    - stager-app
  'swipe-app.local':
    - swipe-app
  'omar-app.local':
    - ossim-core
    - omar-app
  'jpip-app.local':
    - ossim-core
    - jpip-app
  'jpip-server.local':
    - ossim-core
    - jpip-server
  'dev-build.local':
    - java
    - ossim-core.yum-repo
    - x11-min
    - omar-user
    - dev-build
  'msp-build.local':
    - java
    - ossim-core.yum-repo
    - x11-min
    - omar-user
    - dev-build
  'jenkins.local':
    - java
    - ossim-core.yum-repo
#    - jenkins-setup
    - jenkins
    - jenkins.plugins
#    - jenkins.ossim-devel-install
  'test.local':
    - java
    - ossim-core.yum-repo
