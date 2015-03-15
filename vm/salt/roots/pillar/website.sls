# virtualenv setup

website_venv: site
website_venv_dir: /home/vagrant/venv
website_venv_bin: /home/vagrant/venv/site

# source code
website_src_dir: /home/vagrant/app
website_requirements_path: /home/vagrant/app/app/requirements.txt
website_settings_path: /home/vagrant/app/app/settings/local.py
website_settings: app.settings.local
website_static_dir: /home/vagrant/app/collected_static/
website_bower: /home/vagrant/app/app/components/bower_components
website_bootstrap: /home/vagrant/app/app/static/bootstrap
# gunicorn paths
website_gunicorn_bin_path: /home/vagrant/venv/site/bin/gunicorn
website_gunicorn_conf_path: /home/vagrant/gunicorn.conf.py

# emacs path
dot_files: /home/vagrant/.dot_files
