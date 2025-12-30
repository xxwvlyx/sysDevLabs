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
                  sudo dpkg -i ../*.deb || sudo apt -f install -y
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
