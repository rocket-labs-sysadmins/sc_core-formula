{% set venture = salt['pillar.get']('venture', {}) -%}

/etc/salt/cloud.providers.d/{{ venture }}.conf:
  file.managed:
    - source: salt://sc_core/files/cloud-providers.jinja
    - template: jinja

/etc/salt/cloud.profiles.d/{{ venture }}.conf:
  file.managed:
    - source: salt://sc_core/files/cloud-profiles.jinja
    - template: jinja

/etc/salt/{{ venture }}.pem:
  file.managed:
    - mode: 0400
    - user: root
    - group: root
    - source: salt://sc_core/files/keys/{{ venture }}.pem
