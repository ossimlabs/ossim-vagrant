ossim:
  user: omar
  group: omar
  yum_repo: http://s3.amazonaws.com/o2-rpms
  dependencies: http://s3.amazonaws.com/ossimlabs/dependencies
  database: 
    name: omardb-prod
    host: 192.168.2.100
    port: 5432
    connection: "jdbc:postgresql://192.168.2.100:5432/omardb-prod" 
    username: "postgres"
    password: "postgres"
    dialect: "org.hibernate.spatial.dialect.postgis.PostgisDialect"
  wmts-app:
    wmsUrl: http://192.168.2.103:8080/wms
    wfsUrl: http://192.168.2.104:8080/wfs
    legacyWmsFlag: false
    serverURL: http://192.168.2.101:8080
    assetsURL: http://192.168.2.101:8080/assets/
  stager-app:
    serverURL: http://192.168.2.102:8080
    assetsURL: http://192.168.2.102:8080/assets/
  wms-app:
    serverURL: http://192.168.2.103:8080
    assetsURL: http://192.168.2.103:8080/assets/
  wfs-app:
    serverURL: http://192.168.2.104:8080
    assetsURL: http://192.168.2.104:8080/assets/
  superoverlay-app:
    serverURL: http://192.168.2.105:8080
    assetsURL: http://192.168.2.105:8080/assets/
  omar-app:
    serverURL: http://192.168.2.120:8080
    assetsURL: http://192.168.2.120:8080/assets/
