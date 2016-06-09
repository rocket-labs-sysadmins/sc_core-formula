{% from "sc_core/map.jinja" import patches with context -%}

{{ patches.cloud }}:
  file.managed:
    - source: salt://sc_core/files/cloud.py
