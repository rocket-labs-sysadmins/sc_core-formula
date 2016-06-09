configure-sysstat:
  file.managed:
    - name: /etc/default/sysstat
    - source: salt://sc_core/files/sysstat.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja

configure-sysstat-cron:
  file.managed:
    - name: /etc/cron.d/sysstat
    {%- if 'Debian' in grains['os'] %}
    - source: salt://sc_core/files/sysstat.cron
    {%- else %}
    - source: salt://sc_core/files/sysstat.cron.rh
    {%- endif %}
    - user: root
    - group: root
    - mode: 644
    - template: jinja

