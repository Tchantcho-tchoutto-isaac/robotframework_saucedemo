pipeline {
    agent {
        docker {
            image 'python:3.9-alpine'  
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'  
        }
    }

    environment {
        ROBOT_OPTIONS = "--outputdir results"
    }

    stages {
        stage('Setup') {
            steps {
                sh 'docker --version'  
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

    post {
        always {
            junit 'results/output.xml' 
            archiveArtifacts artifacts: 'results/**/*'  // Archive tous les artefacts
        }
    }
}
