pipeline {
  agent any
  stages {
    stage('Install Dependencies') {
      steps {
        sh 'npm install'
      }
    }

    stage('Unit Testing') {
      steps {
        sh 'npm test'
      }
    }

    stage('Code Coverage') {
      steps {
        sh 'npm run coverage'
      }
    }

  }
}