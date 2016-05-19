base:
  'postgres.local':
    - postgres
  'httpd.local':
    - httpd
  '*-app.local':
    - java
    - ossim-core.yum-repo
  'wmts-app.local':
    - wmts-app
  'wms-app.local':
    - ossim-core
    - wms-app
  'wfs-app.local':
    - ossim-core
    - wfs-app
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
  'test.local':
    - java
    - ossim-core.yum-repo
    - omar-user
    - wmts-app


