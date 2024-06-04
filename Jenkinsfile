pipeline {
  agent any
  stages {
    stage('Install Dependencies') {
      steps {
        sh '''npm install
printenv'''
      }
    }

    stage('Unit Testing') {
      steps {
        sh 'npm test'
        junit 'test-results.xml'
      }
    }

    stage('Code Coverage') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE', message: 'okat') {
          sh 'npm run coverage'
        }

      }
    }

  }
  environment {
    MONGO_URI = 'mongodb+srv://supercluster.d83jj.mongodb.net/superData'
    MONGO_USERNAME = credentials('MONGO_USERNAME')
    MONGO_PASSWORD = credentials('MONGO_PASSWORD')
    a = 'a'
  }
  post {
    always {
      echo 'I will always say Hello again!'
      publishHTML(allowMissing: true, alwaysLinkToLastBuild: true, keepAll: true, reportDir: 'coverage/lcov-report', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true)
    }

  }
}
