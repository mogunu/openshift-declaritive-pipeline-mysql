openshift-declaritive-pipeline-mysql
====================================

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=ryspnc_openshift-declaritive-pipeline-mysql&metric=alert_status)](https://sonarcloud.io/dashboard?id=ryspnc_openshift-declaritive-pipeline-mysql)

An example declaritive jenkins pipeline script that launches a kubernetes pod in OpenShift, with 3 containers:
- "mysql-client" = mysql:5.7
- "mysql-server" = mariadb-102-rhel7:1
- jenkins/jnlp-slave:alpine (added to pod automatically)

## what does the pipeline do?
- Creates a database called "testDB" in the "mysql-server" container, creates a table called "users" and loads some test data into the table.
- From the "mysql-client" container, connect to the "mysql-server"container over TCP and run a SQL QUERY of `SELECT * FROM users`.

## results
![alt text](images/results.png "jenkins pipeline results")

## docs
- [requirements](docs/requirements.md)
- [resources](docs/resources.md)
- [Jenkins kubernetes plugin vs. docker plugin](docs/plugin-comparison.md)