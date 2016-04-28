install-java:
  pkg.installed:
    - pkgs:
      - java-1.8.0-openjdk-devel

install-jai-core:
  cmd.run:
    - name: curl -L {{ salt['pillar.get']('ossim:dependencies')}}/jai/jai_core-1.1.3.jar -o /usr/lib/jvm/java/jre/lib/ext/jai_core-1.1.3.jar
    - creates: /usr/lib/jvm/java/jre/lib/ext/jai_core-1.1.3.jar
    - require:
      - pkg: install-java

install-jai-codec:
  cmd.run:
    - name: curl -L {{ salt['pillar.get']('ossim:dependencies')}}/jai/jai_codec-1.1.3.jar -o /usr/lib/jvm/java/jre/lib/ext/jai_codec-1.1.3.jar
    - creates: /usr/lib/jvm/java/jre/lib/ext/jai_codec-1.1.3.jar
    - require:
      - pkg: install-java

install-jai-imageio:
  cmd.run:
    - name: curl -L {{ salt['pillar.get']('ossim:dependencies')}}/jai/jai_imageio-1.1.jar -o /usr/lib/jvm/java/jre/lib/ext/jai_imageio-1.1.jar
    - creates: /usr/lib/jvm/java/jre/lib/ext/jai_imageio-1.1.jar
    - require:
      - pkg: install-java
