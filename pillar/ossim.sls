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
    serverURL: https://192.168.2.200/wmts-app
    assetsURL: https://192.168.2.200/wmts-app/assets/
  stager-app:
    serverURL: https://192.168.2.200/stager-app
    assetsURL: https://192.168.2.200/stager-app/assets/
  wms-app:
    serverURL: https://192.168.2.200/wms-app
    assetsURL: https://192.168.2.200/wms-app/assets/
  wfs-app:
    serverURL: https://192.168.2.200/wfs-app
    assetsURL: https://192.168.2.200/wfs-app/assets/
  superoverlay-app:
    serverURL: https://192.168.2.200/superoverlay-app
    assetsURL: https://192.168.2.200/superoverlay-app/assets/
  swipe-app:
    serverURL: https://192.168.2.200/swipe-app
    assetsURL: https://192.168.2.200/swipe-app/assets/
  omar-app:
    serverURL: https://192.168.2.200/omar-app
    assetsURL: https://192.168.2.200/omar-app/assets/
  sqs-app:
    serverURL: https://192.168.2.200/sqs-app
    assetsURL: https://192.168.2.200/sqs-app/assets/
    queue: ""
    destinationType: "post"
    urlEndPoint: "https://192.168.2.200/avro-app/avro/addMessage"
    aws-access-key-id: ""
    aws-secret-access-key: ""

  avro-app:
    serverURL: https://192.168.2.200/avro-app
    assetsURL: https://192.168.2.200/avro-app/assets/
    destinationType: "post"
    rootDownloadDirectory: "/data/s3"
    addRasterEndPoint: "https://192.168.2.200/stager-app/dataManager/addRaster"
    addRasterField: "filename"

  jpip-app:
    serverURL: https://192.168.2.200/jpip-app
    assetsURL: https://192.168.2.200/jpip-app/assets/
    server:
      cache: /data/jpip-cache
      ip: "192.168.2.108"
      url: "jpip://192.168.2.108:8080"
  jpip-server:
    url: "jpip://192.168.2.108:8080"
