install-java:
  pkg.installed:
    - pkgs:
      - java-1.8.0-openjdk-devel

/usr/lib/jvm/java/jre/lib/ext/jai_codec-1.1.3.jar:
  file.managed:
    - source: salt://java/jai_codec-1.1.3.jar
    - require:
      - pkg: install-java

/usr/lib/jvm/java/jre/lib/ext/jai_core-1.1.3.jar:
  file.managed:
    - source: salt://java/jai_core-1.1.3.jar
    - require:
      - pkg: install-java

/usr/lib/jvm/java/jre/lib/ext/jai_imageio-1.1.jar:
  file.managed:
    - source: salt://java/jai_imageio-1.1.jar
    - require:
      - pkg: install-java

