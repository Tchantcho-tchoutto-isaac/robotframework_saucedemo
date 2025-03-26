pipeline {
    agent {
        docker {
            image 'python:3.9-alpine'  // Utilisation de l'image Python
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'  // Donne accès au socket Docker
        }
    }

    environment {
        ROBOT_OPTIONS = "--outputdir results"
    }

    stages {
        stage('Setup') {
            steps {
                sh 'docker --version'  // Vérifie que Docker est accessible dans Jenkins
                sh 'pip install --upgrade pip'
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'robot ${ROBOT_OPTIONS} tests/'  // Exécute les tests Robot Framework
            }
        }
    }

    post {
        always {
            junit 'results/output.xml'  // Archive les résultats des tests
            archiveArtifacts artifacts: 'results/**/*'  // Archive tous les artefacts
        }
    }
}
