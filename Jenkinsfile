pipeline {
agent none
    stages {
        stage('Test') {
         agent { dockerfile true }
            steps {
               echo "Test step"
            }
        }
    }
}