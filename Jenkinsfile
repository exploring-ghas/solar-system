pipeline {
  agent any
  stages {
//     stage('Install Dependencies') {
//       steps {
//         sh '''npm install
// printenv'''
//       }
//     }

//     stage('Unit Testing') {
//       steps {
//         sh 'npm test'
//         junit 'test-results.xml'
//       }
//     }

//     stage('Code Coverage') {
//       steps {
//         catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE', message: 'okat') {
//           sh 'npm run coverage'
//         }

//       }
//     }

  stage('Docker Build and Test') {
      steps {
        sh 'docker build -t siddharth67/numeric-app:""$GIT_COMMIT"" . '
      }
    }

  }
  environment {
    MONGO_URI = 'mongodb+srv://supercluster.d83jj.mongodb.net/superData'
    MONGO_USERNAME = credentials('MONGO_USERNAME')
    MONGO_PASSWORD = credentials('MONGO_PASSWORD')
    a = 'abc12123222'
  }
  post {
    always {
      echo 'I will always say Hello again!'
      publishHTML(allowMissing: true, alwaysLinkToLastBuild: true, keepAll: true, reportDir: 'coverage/lcov-report', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true)
    }

  }
}
