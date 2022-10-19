/* Requires the Docker Pipeline plugin */
pipeline {
    agent { Jenkins-Slave }
    stages {
        stage('build') {
            steps {
                echo 'Running Build'
            }
        }

        stage('test') {
            steps {
                echo 'Running Tests'
            }
        }

        stage('deploy') {
            steps {
                echo 'Running Deployment'
            }
        }
    }
}