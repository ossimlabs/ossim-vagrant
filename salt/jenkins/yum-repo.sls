{%- if grains['os_family'] == 'RedHat' %}
jenkins-yum-repo:
  pkgrepo.managed:
    - humanname: Jenkins
    - baseurl: http://pkg.jenkins.io/redhat
    - gpgcheck: 0
{%- endif %}
