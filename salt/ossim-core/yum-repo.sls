{%- if grains['os_family'] == 'RedHat' %}
ossim-yum-repo:
  pkgrepo.managed:
    - humanname: OSSIM-Yum-Repo
#    - baseurl: {{ pillar['ossim']['yum_repo'] }}/CentOS/{{grains.osmajorrelease}}/dev/x86_64
    - baseurl: {{ pillar['ossim']['yum_repo'] }}/CentOS/7/dev/x86_64
    - gpgcheck: 0
{%- endif %}
