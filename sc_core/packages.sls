{% from "sc_core/map.jinja" import packages with context %}

sc_core.packages_present:
  pkg.installed:
    - pkgs:
      {% for package in pkgs_present %}
      {% if package not in pkgs_absent %}
      - {{ package }}
      {%- endif %}
      {%- endfor %}

sc_core.packages_absent:
  pkg.purged:
    - pkgs:
      {% for package in pkgs_absent %}
      - {{ package }}
      {%- endfor %}
