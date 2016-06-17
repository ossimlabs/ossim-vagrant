install-java:
  pkg.installed:
    - pkgs:
      - java-1.8.0-openjdk-devel

install-jai-core:
  file.managed:
    - name: /usr/lib/jvm/java/jre/lib/ext/jai_core-1.1.3.jar
    - source: {{ salt['pillar.get']('ossim:dependencies')}}/jai/jai_core-1.1.3.jar
    - source_hash: {{ salt['pillar.get']('ossim:dependencies')}}/jai/jai_core-1.1.3.jar.md5 

install-jai-codec:
  file.managed:
    - name: /usr/lib/jvm/java/jre/lib/ext/jai_codec-1.1.3.jar
    - source: {{ salt['pillar.get']('ossim:dependencies')}}/jai/jai_codec-1.1.3.jar
    - source_hash: {{ salt['pillar.get']('ossim:dependencies')}}/jai/jai_codec-1.1.3.jar.md5 

install-jai-imageio:
  file.managed:
    - name: /usr/lib/jvm/java/jre/lib/ext/jai_imageio-1.1.jar
    - source: {{ salt['pillar.get']('ossim:dependencies')}}/jai/jai_imageio-1.1.jar
    - source_hash: {{ salt['pillar.get']('ossim:dependencies')}}/jai/jai_imageio-1.1.jar.md5 

copy-cert:
  file.managed:
    - name: /etc/pki/java/oc2s.pem
    - source: salt://httpd/oc2s.pem
    - order: first
 
delete-cert:
 cmd.run:
    - name: keytool -delete -trustcacerts -noprompt -alias oc2s -keystore $(readlink -f /usr/bin/java | sed "s:bin/java::")lib/security/cacerts -storepass changeit
    - watch:
      - file: copy-cert
    - require:
      - pkg: install-java

install-cacert:
  cmd.run:
    - name: keytool -import -trustcacerts -noprompt -file /etc/pki/java/oc2s.pem -alias oc2s -keystore $(readlink -f /usr/bin/java | sed "s:bin/java::")lib/security/cacerts -storepass changeit
    - require:
      - pkg: install-java
    - order: last
