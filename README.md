# openshift-declaritive-pipeline-mysql

## what is this?

An example declaritive jenkins pipeline script that launches a kubernetes pod in OpenShift, with 3 containers:
- mysql-client
- mysql-server
- jnlp

In the Jenkinsfile, the mysql-client container will connect over TCP to the mysql-server container running the database.