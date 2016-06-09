{% from "sc_core/map.jinja" import pkgs with context %}

sc_core.packages_present:
  pkg.installed:
    - pkgs:
      {% for package in pkgs.present %}
      {% if package not in pkgs.absent %}
      - {{ package }}
      {%- endif %}
      {%- endfor %}

sc_core.packages_absent:
  pkg.purged:
    - pkgs:
      {% for package in pkgs.absent %}
      - {{ package }}
      {%- endfor %}
