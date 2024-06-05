pipeline {
  agent any
  stages {
    stage('Install Dependencies') {
      steps {
        sh 'npm install'
      }
    }

    stage('Docker Build and Test') {
        steps {
          sh 'docker build -t siddharth67/numeric-app:""$GIT_COMMIT"" . '
        }
      }
  }  
  
}
