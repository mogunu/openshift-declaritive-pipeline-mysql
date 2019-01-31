
// def label = "mysql-${UUID.randomUUID().toString()}" 

// def databaseUsername = 'test'
// def databasePassword = 'test'
// def databaseRootPassword = 'secret'
// def databaseName = 'testDB'
// def databaseHost = '127.0.0.1'
// def databasePort = '3306'

pipeline {
  options {
    buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
  }  
  agent {
    kubernetes {
      cloud 'openshift'
      label 'mysql'
      defaultContainer 'mysql'
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    description: mysql-pod
spec:
  containers:
  #mysql-client
  - name: mysql-client
    image: mysql:5.7
    resources:
      limits:
        memory: 256Mi
    command:
    - cat
    tty: true
  #mysql-server
  - name: mysql-server
    image: registry.access.redhat.com/rhscl/mariadb-102-rhel7:1
    resources:
      limits:
        memory: 256Mi
    env:
    - name: MYSQL_USER
      value: test
    - name: MYSQL_PASSWORD
      value: test
    - name: MYSQL_DATABASE
      value: testDB
    - name: MYSQL_ROOT_PASSWORD
      value: secret
    readinessProbe:
      tcpSocket:
        port: 3306
    initialDelaySeconds: 5
"""
    }
  }
  stages {

    stage('mysql-server') {
     steps {
      container('mysql-server') {
            sh 'hostname'
            sh 'pwd'
            sh 'ls -alh'
            sh 'scripts/setup.sh'
        }
      }
    }

    stage('mysql-client') {
      steps {
        container('mysql-client') {
          sh 'hostname'
          sh 'pwd'
          sh 'ls -alh'
          sh 'mysql --user=test --password=test --host=127.0.0.1 --port=3306 --protocol=TCP -e "show databases;"'
          sh 'mysql --user=test --password=test --host=127.0.0.1 --port=3306 --protocol=TCP testDB -e "SELECT * FROM users;"'
        }
    }

    }
  }
}
