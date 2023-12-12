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
        agent any
            steps {
               sh 'docker build -t freya:${scmInfo.GIT_COMMIT} .'
            }
        }

        stage('Deploy') {
        agent any

                    steps {
                       sh 'docker kill $(docker ps -q)'
                       sh 'docker run -d --net="host" freya:${scmInfo.GIT_COMMIT}'
                       sh 'docker rm $(docker ps -a -q)'
                    }
                }
    }
}