#!/bin/bash

mysql --user=test --password=test -h 127.0.0.1 testDB <scripts/create-tables.sql
mysql --user=test --password=test -h 127.0.0.1 testDB <scripts/load-data.sql