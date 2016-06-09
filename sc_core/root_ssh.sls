root_ssh_keys:
  cmd.run:
    - name: ssh-keygen -f /root/.ssh/id_rsa -t rsa -N '';salt-call saltutil.sync_all;salt-call mine.update
    - unless: '[ -e /root/.ssh/id_rsa ]'
    - require:
      - file: /root/.ssh
    
/root/.ssh:
  file.directory:
    - user: root
    - group: root
    - mode: 600
    - makedirs: True
