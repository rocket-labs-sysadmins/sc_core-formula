{% set oom_kill_protection = salt['pillar.get']('oom_kill_protection', {}) -%}

{% if oom_kill_protection|length > 0 %}

/usr/local/sbin/oom_kill_protection:
  file.managed:
    - source: salt://sc_core/files/oom_kill_protection.script.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 755
    - context:
        oom_kill_protection: {{ oom_kill_protection|yaml }}

/etc/cron.d/oom_kill_protection:
  file.managed:
    - source: salt://sc_core/files/oom_kill_protection.cron
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: /usr/local/sbin/oom_kill_protection

/etc/logrotate.d/oom_kill_protection:
  file.managed:
    - source: salt://sc_core/files/oom_kill_protection.logrotate
    - user: root
    - group: root
    - mode: 644

{% else %}

# oom_kill_protection configuration was empty.
# We must clean up the files.

/usr/local/sbin/oom_kill_protection:
  file.absent

/etc/cron.d/oom_kill_protection:
  file.absent

/etc/logrotate.d/oom_kill_protection:
  file.absent

{% endif %}
