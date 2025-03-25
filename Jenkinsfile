pipeline {
    agent any

    environment {
 
        PYTHON = "python"
        ROBOT_OPTIONS = "--outputdir results"
        BROWSER = "chrome"
        REMOTE_URL = "http://localhost:4444/wd/hub" 
    }

    stages {
        stage('Préparation') {
            steps {
                script {
                    echo "Installation des dépendances..."
                    sh "${PYTHON} -m pip install --upgrade pip"
                    sh "${PYTHON} -m pip install -r requirements.txt"
                }
            }
        }

        stage('Exécution des tests') {
            steps {
                script {
                    echo "Lancement des tests Robot Framework..."
                    sh "${PYTHON} -m robot ${ROBOT_OPTIONS} --variable BROWSER:${BROWSER} --variable REMOTE_URL:${REMOTE_URL} tests/"
                }
            }
        }
    }

    post {
        always {
            // Archivage des résultats et rapports
            archiveArtifacts artifacts: 'results/**/*', allowEmptyArchive: true
            robot allowMissing: true, disableArchiveOutput: false, outputPath: 'results'
        }
    }
}