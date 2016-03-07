base:
  'postgres.local':
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

