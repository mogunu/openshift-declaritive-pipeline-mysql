#!/bin/bash

mysql -u myuser -pmypassword -h 127.0.0.1 testDB <scripts/create-tables.sql
mysql -u myuser -pmypassword -h 127.0.0.1 testDB <scripts/load-data.sql