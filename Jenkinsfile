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
                sh 'dpkg-buildpackage -us -uc'
            }
        }

        stage('Install DEB') {
            steps {
                sh '''
                dpkg -i ../etc-snapshot_1.0-1_all.deb || true
                apt-get -f install -y
                '''
            }
        }

        stage('Run Script') {
            steps {
                sh '''
                chmod +x ./scripts/script.bash
                ./scripts/script.bash
                '''
            }
        }
    }

    post {
        success { echo 'Pipeline completed successfully!' }
        failure { echo 'Pipeline failed. Check the logs!' }
    }
}
