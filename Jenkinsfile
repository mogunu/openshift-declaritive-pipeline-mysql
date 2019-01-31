pipeline {
  options {
    buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
  }  
  agent {
    kubernetes {
      cloud 'openshift'
      label 'mysql'
      defaultContainer 'mysql'
      yamlFile 'pod.yaml'
    }
  }
  stages {

    stage('mysql-server') {
     steps {
      container('mysql-server') {
            sh 'scripts/setup.sh' // load data into database
        }
      }
    }

    stage('mysql-client') {
      steps {
        container('mysql-client') {
            sh 'scripts/test.sh' // run SQL query against mysql-server container over TCP
        }
    }

    }
  }
}
