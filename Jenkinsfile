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
        publishHTML(alwaysLinkToLastBuild: true, 
                    keepAll: true, 
                    reportDir: 'mochawesome-report', 
                    reportFiles: 'mochawesome.html', 
                    reportName: 'Mocha Awesome HTML Report'
                  )
      }
    }

    stage('Code Coverage') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE', message: 'okat') {
          sh 'npm run coverage'
          publishHTML(alwaysLinkToLastBuild: true, 
            keepAll: true, 
            reportDir: 'coverage', 
            reportFiles: 'lcov-report/index.html', 
            reportName: 'NYC HTML Report'
          )
        }
        
      
      }
    }

  }
  environment {
    MONGO_URI = 'mongodb+srv://supercluster.d83jj.mongodb.net/superData'
    MONGO_USERNAME = 'superuser'
    MONGO_PASSWORD = 'SuperPassword'
  }
}
