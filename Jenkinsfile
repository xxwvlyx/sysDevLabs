pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build DEB') {
            steps {
                sh '''
                dpkg-buildpackage -us -uc
                '''
            }
        }

        stage('Install DEB') {
            steps {
                sh '''
                sudo dpkg -i ../etc-snapshot_1.0-1_all.deb || true
                sudo apt-get -f install -y
                '''
            }
        }

        stage('Run Script') {
            steps {
                sh '''
                sudo chmod +x ./scripts/script.bash
                sudo ./scripts/script.bash
                '''
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs!'
        }
    }
}
