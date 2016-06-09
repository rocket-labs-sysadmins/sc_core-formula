include:
  - sc_core.packages
  - sc_core.sysstat
  - sc_core.logrotate
  - sc_core.motd
  - sc_core.root_ssh
  - sc_core.salt_patches
  - sc_core.limits
  - sc_core.oom_kill_protection

/root/.bashrc:
  file.managed:
    - source: salt://sc_core/files/bashrc.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644

/root/.inputrc:
  file.managed:
    - source: salt://sc_core/files/inputrc.jinja
    - user: root
    - group: root
    - mode: 644

UTC:
  timezone.system:
    - utc: True

{%- if 'RedHat' in grains['os_family'] %}

selinux-mgmt-packages:
  pkg.installed:
    - pkgs:
      - selinux-policy-targeted
      - policycoreutils-python

/etc/selinux/config:
  file.managed:
    - source: salt://sc_core/files/selinux.jinja
    - user: root
    - group: root
    - mode: 644

{%- endif %}
