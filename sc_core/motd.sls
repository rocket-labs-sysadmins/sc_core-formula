motd:
  file.managed:
    - name: /etc/motd
    - source: salt://sc_core/files/motd.jinja
    - mode: 644
    - template: jinja

{% if grains['os'] == 'Ubuntu' %}
/etc/pam.d/sshd:
  file.comment:
    - regex: ^session    optional     pam_motd.so  motd=
{% endif %}
