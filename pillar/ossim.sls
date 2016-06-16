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
#    wmsUrl: http://192.168.2.200/wms-app/wms
#    wfsUrl: http://192.168.2.200/wfs-app/wfs
    wmsUrl: http://o2.ossim.org/o2/wms
    wfsUrl: http://o2.ossim.org/o2/wfs
    legacyWmsFlag: false
    serverURL: http://192.168.2.200/wmts-app
    assetsURL: http://192.168.2.200/wmts-app/assets/
  stager-app:
    serverURL: http://192.168.2.200/stager-app
    assetsURL: http://192.168.2.200/stager-app/assets/
  wms-app:
    serverURL: http://192.168.2.200/wms-app
    assetsURL: http://192.168.2.200/wms-app/assets/
  wfs-app:
    serverURL: http://192.168.2.200/wfs-app
    assetsURL: http://192.168.2.200/wfs-app/assets/
  superoverlay-app:
    serverURL: http://192.168.2.200/superoverlay-app
    assetsURL: http://192.168.2.200/superoverlay-app/assets/
  swipe-app:
    serverURL: http://192.168.2.200/swipe-app
    assetsURL: http://192.168.2.200/swipe-app/assets/
  omar-app:
    serverURL: http://192.168.2.200/omar-app
    assetsURL: http://192.168.2.200/omar-app/assets/
  sqs-app:
    serverURL: http://192.168.2.200/sqs-app
    assetsURL: http://192.168.2.200/sqs-app/assets/
    queue: ""
    destinationType: "post"
    urlEndPoint: "http://192.168.2.200/avro-app/avro/addMessage"
    aws-access-key-id: ""
    aws-secret-access-key: ""

  avro-app:
    serverURL: http://192.168.2.200/avro-app
    assetsURL: http://192.168.2.200/avro-app/assets/
    destinationType: "post"
    rootDownloadDirectory: "/data/s3"
    addRasterEndPoint: "http://192.168.2.200/stager-app/dataManager/addRaster"
    addRasterField: "filename"

  jpip-app:
    serverURL: http://192.168.2.200/jpip-app
    assetsURL: http://192.168.2.200/jpip-app/assets/
    server:
      cache: /data/jpip-cache
      ip: "192.168.2.108"
      url: "jpip://192.168.2.108:8080"
  jpip-server:
    url: "jpip://192.168.2.108:8080"
