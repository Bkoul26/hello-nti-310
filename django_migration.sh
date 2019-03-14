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
perl -i -pe 's/DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}/DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'myproject',
        'USER': 'myprojectuser',
        'PASSWORD': 'password',
        'HOST': 'postgres-b',
        'PORT': '5432',
    }
}/g' ~/myproject/myproject/settings.py

