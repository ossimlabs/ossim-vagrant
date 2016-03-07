#####
# Password default is the the md5 hash for
# abc123!@#
#
# user: omar
# password: abc123!@#
#####
install-omar-user:
  user.present:
    - name: omar
    - password: $1$n4gc36Db$foyfmteM0zgPn6Rl/BZpS/
    - fullname: Omar
    - shell: /bin/bash
    - home: /home/omar
    - createhome: True
    - groups:
      - wheel

sudoers-superuser:
    file.append:
        - name: /etc/sudoers
        - text:
          - "omar    ALL=(ALL) NOPASSWD: ALL"