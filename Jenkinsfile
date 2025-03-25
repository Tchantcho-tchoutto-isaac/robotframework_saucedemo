pipeline {
    agent {
        docker {
            image 'python:3.9-alpine'  // Image avec Python pré-installé
            args '-u root'  // Exécute en tant que root
        }
    }

    environment {
        ROBOT_OPTIONS = "--outputdir results"
    }

    stages {
        stage('Setup') {
            steps {
                sh 'python --version'
                sh 'pip install --upgrade pip'
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'robot ${ROBOT_OPTIONS} tests/'
            }
        }
    }

}