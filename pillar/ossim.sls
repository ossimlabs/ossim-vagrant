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
  omar-app:
    url: http://192.168.2.101:8080/
    host: 192.168.2.101
    port: 8080
  wmts-app:
     wfsUrl: http://o2.ossim.org/o2/wfs
     wmsUrl: http://o2.ossim.org/o2/wms
     legacyWmsFlag: false
