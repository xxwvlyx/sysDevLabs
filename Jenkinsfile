pipeline {
    agent any

    stages {
        stage('Checkout') {
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
        dpkg -i ../etc-snapshot_1.0-1_all.deb || true
        apt-get update
        apt-get -f install -y
        '''
    		}
        }

        stage('Run script') {
            steps {
                sh '''
                  script
                '''
            }
        }
    }
}
