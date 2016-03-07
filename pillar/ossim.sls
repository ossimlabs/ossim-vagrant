ossim:
  yum_repo: http://s3.amazonaws.com/o2-rpms
  database: 
    name: omardb-prod
    host: 192.168.2.100
    port: 5432
    connection: "jdbc:postgresql://192.168.2.100:5432/omardb-prod" 
  omar-app:
    url: http://192.168.2.101:8080/
    host: 192.168.2.101
    port: 8080
