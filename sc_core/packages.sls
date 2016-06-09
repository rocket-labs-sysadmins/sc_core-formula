{% set pkgs_present = salt['pillar.get']('sc_core:pkgs_present', []) %}
{% set pkgs_absent = salt['pillar.get']('sc_core:pkgs_absent', []) %}

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
