pipeline {
agent none
    stages {
        stage('Test') {
         agent { dockerfile true }
            steps {
               sh 'bundle exec rspec'
            }
        }

        stage('Build') {
            steps {
               sh 'docker build -t freya:${scmInfo.GIT_COMMIT} .'
            }
        }

        stage('Deploy') {
                    steps {
                       sh 'docker kill $(docker ps -q)'
                       sh 'docker run -d --net="host" freya:${scmInfo.GIT_COMMIT}'
                       sh 'docker rm $(docker ps -a -q)'
                    }
                }
    }
}