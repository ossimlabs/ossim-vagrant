base:
  'postgres.local':
    - postgres
  'wmts-app.local':
    - java
    - ossim-core.yum-repo
    - omar-user
    - wmts-app
  'wms-app.local':
    - java
    - ossim-core
    - omar-user
    - wms-app
  'wfs-app.local':
    - java
    - ossim-core
    - omar-user
    - wfs-app
  'superoverlay-app.local':
    - java
    - ossim-core
    - omar-user
    - superoverlay-app
  'stager-app.local':
    - java
    - ossim-core
    - omar-user
    - stager-app
  'swipe-app.local':
    - java
    - ossim-core.yum-repo
    - omar-user
    - swipe-app
  'omar-app.local':
    - java
    - omar-user
    - ossim-core
    - omar-user
    - omar-app
  'httpd.local':
    - httpd
  'workflow.local':
    - postgres
    - java7
    - x11-min
  'ossim-core.local':
    - ossim-core
  'ossim-geocell.local':
    - ossim-core
    - ossim-geocell

