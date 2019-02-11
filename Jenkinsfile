pipeline {

  options {
    buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
  } 

  agent {
    kubernetes {
      cloud 'openshift' // the name of the kubernetes cloud in Jenkins
      label 'mysql'
      defaultContainer 'mysql'
      yamlFile 'pod.yaml'
    }
  }

  stages {

    stage('mysql-server') {
     steps {
      container('mysql-server') {
            sh 'scripts/setup.sh' // load data into database on mysql-server container
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

  } // end stages

    post {
        always {
            deleteDir() /* clean up our workspace */
        }
    }

} // end pipeline
