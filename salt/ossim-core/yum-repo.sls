ossim-yum-repo:
  pkgrepo.managed:
    - humanname: OSSIM-Yum-Repo
    - baseurl: {{ pillar['ossim']['yum_repo'] }}/CentOS/6/dev/x86_64
    - gpgcheck: 0
