#!/bin/bash

sudo -u postgres pg_restore < /home/vagrant/database/situnes.dmp
