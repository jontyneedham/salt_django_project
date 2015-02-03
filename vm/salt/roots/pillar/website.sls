# virtualenv setup
website_venv_dir: /home/vagrant/venv
website_venv_activate_path: /home/vagrant/venv/bin/activate

# source code
website_src_dir: /home/vagrant/app
website_requirements_path: /home/vagrant/app/app/requirements.txt
website_settings_path: /home/vagrant/app/app/settings/dev.py
website_static_dir: /home/vagrant/app/app/collected_static/

# gunicorn paths
website_gunicorn_bin_path: /home/vagrant/venv/bin/gunicorn
website_gunicorn_conf_path: /home/vagrant/gunicorn.conf.py

# emacs path
dot_files: /home/vagrant/.dot_files