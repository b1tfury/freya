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
        agent { node { label 'home' } }
            steps {
               sh 'env'
               sh 'docker build -t $GIT_COMMIT .'
            }
        }

        stage('Deploy') {
        agent { node { label 'home' } }
                    steps {
                       sh 'docker kill freya
                       sh 'docker run -d --net="host" --name freya $GIT_COMMIT'
                       sh 'docker rm $GIT_PREVIOUS_SUCCESSFUL_COMMIT'
                    }
                }
    }
}