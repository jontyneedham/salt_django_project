{{ pillar['website_venv_dir'] }}:
  file:
    - directory
    - user: owner
    - group: owner
    - makedirs: True

  virtualenv:
    - managed
    - no_site_packages: True
    - distribute: True
    - requirements: {{ pillar['website_requirements_path'] }}
    - user: owner
    - no_chown: True
    - require:
      - pip: virtualenv
      - file: {{ pillar['website_venv_dir'] }}

django settings:
  file:
    - managed
    - name: {{ pillar['website_settings_path'] }}
    - source: salt://website/local.py.template

django-admin migrate:
  module:
    - run
    - name: django.syncdb
    - bin_env: {{ pillar['website_venv_dir'] }}
    - settings_module: app.settings.local
    - pythonpath: {{ pillar['website_src_dir'] }}
    - migrate: True
    - require:
      - virtualenv: {{ pillar['website_venv_dir'] }}
      - file: django settings