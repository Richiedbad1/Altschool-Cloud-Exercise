#!/bin/bash

echo "updating apt "
apt upgrade -y

echo "installing postgres"
apt install postgresql -y

sudo -i -u postgres bash << EOF
echo "In"
echo "creating user"
echo "creating database myappdb"
psql
CREATE USER myapp WITH PASSWORD 'myapp';
CREATE DATABASE myappdb WITH OWNER myapp;
EOF
