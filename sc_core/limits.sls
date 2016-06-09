/etc/security/limits.d/20-nproc.conf:
  file.managed:
    - source: salt://sc_core/files/limits.conf
    - mode: 644
