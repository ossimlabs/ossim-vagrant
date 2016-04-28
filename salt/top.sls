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
    - wms-app
  'workflow.local':
    - postgres
    - java7
    - x11-min
  'ossim-core.local':
    - ossim-core
  'ossim-geocell.local':
    - ossim-core
    - ossim-geocell
  'omar-app.local':
    - java
    - postgres-client
    - omar-user
    - ossim-core
    - omar-app

