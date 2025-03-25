pipeline {
    agent {
        docker {
            image 'python:3.9'
            args '-u root'
        }
    }

    environment {
        ROBOT_OPTIONS = "--outputdir results"
    }

    stages {
        stage('Préparation') {
            steps {
                sh 'python --version'
                sh 'pip install --upgrade pip'
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Exécution des tests') {
            steps {
                sh 'robot ${ROBOT_OPTIONS} tests/'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/**/*'
            // Alternative si le plugin Robot n'est pas installé
            junit 'results/output.xml'
        }
    }
}