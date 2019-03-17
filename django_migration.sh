#!/bin/bash

#install pip, which is the package manager for python
yum install -y python-pip

#install virtualenv, which allows us to create a second python instance isololated from the system python
pip install virtualenv

#upgrade pip
pip install --upgrade pip

#Create a project dir and cd into it
mkdir ~/myproject 
cd ~/myproject

#use virtualenv to create a new python install called myprojectenv, then activate that install of python
virtualenve myprojectenv
source myprojectenv/bin/activate

#install django and psycopg2 into myprojectenv
pip install django psycopg2
django-admin.py startproject myproject .

#edit the config file to uptdate your db with relevent credentials
wget -O ~/myproject/myproject/settings.py https://github.com/nic-instruction/hello-nti-310/blob/master/settings.py

# Make sure postgres-a (or your postgres server) is configured with this line in vim /var/lib/pgsql/data/pg_hba.conf
# host    all             all               0.0.0.0/0            md5
# instead of 
# host    all             all             127.0.0.1/32            ident
python manage.py makemigrations
python manage.py migrate
