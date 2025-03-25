pipeline {
    agent any
    
    environment {
        ROBOT_OPTIONS = "--outputdir results"
    }

    stages {
        stage('Setup') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'python3 --version'
                        sh 'python3 -m pip install --upgrade pip'
                        sh 'python3 -m pip install -r requirements.txt'
                    } else {
                        bat 'python --version'
                        bat 'python -m pip install --upgrade pip'
                        bat 'python -m pip install -r requirements.txt'
                    }
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    if (isUnix()) {
                        sh "robot ${env.ROBOT_OPTIONS} tests/"
                    } else {
                        bat "robot ${env.ROBOT_OPTIONS} tests/"
                    }
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/**/*'
            junit 'results/output.xml'
        }
    }
}