base:
  'postgres.local':
    - postgres
  'workflow.local':
    - postgres
    - java7
    - x11-min
  'yumcache.local':
    - yumcache
    - postgres
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

