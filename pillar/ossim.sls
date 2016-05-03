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
    # wmsUrl: http://192.168.2.103:8080/wms
    # wfsUrl: http://192.168.2.104:8080/wfs
    wmsUrl: http://192.168.2.200/wms-app/wms
    wfsUrl: http://192.168.2.200/wms-app/wfs
    legacyWmsFlag: false
    # serverURL: http://192.168.2.101:8080
    # assetsURL: http://192.168.2.101:8080/assets/
    serverURL: http://192.168.2.200/wmts-app
    assetsURL: http://192.168.2.200/wmts-app/assets
    javaOpts: "-server -Xms256m -Xmx768m -Djava.awt.headless=true -XX:+CMSClassUnloadingEnabled -XX:+UseGCOverheadLimit"
  stager-app:
    # serverURL: http://192.168.2.102:8080
    # assetsURL: http://192.168.2.102:8080/assets/
    serverURL: http://192.168.2.200/stager-app
    assetsURL: http://192.168.2.200/stager-app/assets/
    javaOpts: "-server -Xms256m -Xmx768m -Djava.awt.headless=true -XX:+CMSClassUnloadingEnabled -XX:+UseGCOverheadLimit"
  wms-app:
    # serverURL: http://192.168.2.103:8080
    # assetsURL: http://192.168.2.103:8080/assets/
    serverURL: http://192.168.2.200/wms-app
    assetsURL: http://192.168.2.200/wms-app/assets/
    javaOpts: "-server -Xms256m -Xmx768m -Djava.awt.headless=true -XX:+CMSClassUnloadingEnabled -XX:+UseGCOverheadLimit"
  wfs-app:
    # serverURL: http://192.168.2.104:8080
    # assetsURL: http://192.168.2.104:8080/assets/
    serverURL: http://192.168.2.200/wfs-app
    assetsURL: http://192.168.2.200/wfs-app/assets/
    javaOpts: "-server -Xms256m -Xmx512m -Djava.awt.headless=true -XX:+CMSClassUnloadingEnabled -XX:+UseGCOverheadLimit"
  superoverlay-app:
    # serverURL: http://192.168.2.105:8080
    # assetsURL: http://192.168.2.105:8080/assets/
    serverURL: http://192.168.2.200/superoverlay-app
    assetsURL: http://192.168.2.200/superoverlay-app/assets/
    javaOpts: "-server -Xms256m -Xmx512m -Djava.awt.headless=true -XX:+CMSClassUnloadingEnabled -XX:+UseGCOverheadLimit"
  swipe-app:
    # serverURL: http://192.168.2.106:8080
    # assetsURL: http://192.168.2.106:8080/assets/
    serverURL: http://192.168.2.200/swipe-app
    assetsURL: http://192.168.2.200/swipe-app/assets/
    javaOpts: "-server -Xms256m -Xmx512m -Djava.awt.headless=true -XX:+CMSClassUnloadingEnabled -XX:+UseGCOverheadLimit"
  omar-app:
    # serverURL: http://192.168.2.120:8080
    # assetsURL: http://192.168.2.120:8080/assets/
    serverURL: http://192.168.2.200/omar-app
    assetsURL: http://192.168.2.200/omar-app/assets/
    javaOpts: "-server -Xms256m -Xmx768m -Djava.awt.headless=true -XX:+CMSClassUnloadingEnabled -XX:+UseGCOverheadLimit"
