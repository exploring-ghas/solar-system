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
        junit(testResults: 'test-results.xml', checksName: 'ChecksName', keepProperties: true, keepLongStdio: true)
      }
    }

    stage('Code Coverage') {
      steps {
        sh 'npm run coverage'
        warnError(message: 'errr')
      }
    }

  }
  environment {
    MONGO_URI = 'mongodb+srv://supercluster.d83jj.mongodb.net/superData'
    MONGO_USERNAME = 'superuser'
    MONGO_PASSWORD = 'SuperPassword'
  }
}