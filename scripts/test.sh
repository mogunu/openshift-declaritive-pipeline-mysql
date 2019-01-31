#!/bin/bash
set -ex

hostname
pwd
ls -alh

// connect to mysql-server container, run a SQL QUERY
mysql --user=test --password=test --host=127.0.0.1 --port=3306 --protocol=TCP -e "show databases;"
mysql --user=test --password=test --host=127.0.0.1 --port=3306 --protocol=TCP testDB -e "SELECT * FROM users;"