{{ pillar['website_src_dir'] }}:
  file.directory:
    - user: vagrant
    - group: vagrant
    - mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode


{{ pillar['website_venv_bin'] }}:
  file.directory:
    - user: vagrant
    - group: vagrant
    - mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

git:
  pkg.installed

node.js:
  pkg.installed

node_link:
  cmd.run:
    - name: ln -s /usr/bin/nodejs /usr/bin/node
npm:
  pkg.installed

bower:
  npm.installed:
    - require:
      - pkg: npm


app_requirements:
  pip.installed:
    - bin_env: {{ pillar['website_venv_bin'] }}
    - requirements: {{ pillar['website_requirements_path'] }}
    - no_chown: True

django settings:
  file:
    - managed
    - name: {{ pillar['website_settings_path'] }}
    - source: salt://website/local.py.template
    - template: jinja

django-admin syncdb:
  module:
    - run
    - name: django.syncdb
    - bin_env: {{ pillar['website_venv_bin'] }}
    - settings_module: {{ pillar['website_settings'] }}
    - pythonpath: {{ pillar['website_src_dir'] }}
    - migrate: True
    - require:
      - file: django settings

django bower:
  module:
    - run
    - name: django.command
    - command: bower install
    - bin_env: {{ pillar['website_venv_bin'] }}
    - settings_module: {{ pillar['website_settings'] }}
    - pythonpath: {{ pillar['website_src_dir'] }}

django collectstatic:
  module:
    - run
    - name: django.collectstatic
    - bin_env: {{ pillar['website_venv_bin'] }}
    - settings_module: {{ pillar['website_settings'] }}
    - pythonpath: {{ pillar['website_src_dir'] }}


# django-admin migrate:
#   module:
#     - run
#     - name: django.loaddata
#     - bin_env: {{ pillar['website_venv_bin'] }}
#     - settings_module: {{ pillar['website_settings'] }}
#     - pythonpath: {{ pillar['website_src_dir'] }}
#     - migrate: True
#     - require:
#       - file: django settings
