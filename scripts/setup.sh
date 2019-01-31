#!/bin/bash
set -ex

hostname
pwd
ls -alh

# create database table and load data
mysql -V
mysql --user=test --password=test -h 127.0.0.1 -e "SHOW VARIABLES LIKE '%version%';"
mysql --user=test --password=test -h 127.0.0.1 testDB <scripts/create-tables.sql
mysql --user=test --password=test -h 127.0.0.1 testDB <scripts/load-data.sql
