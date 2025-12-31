pipeline {
    agent any

    stages {

        stage('Checkout SCM') {
            steps {
                checkout([$class: 'GitSCM',
                    branches: [[name: '*/master']],
                    userRemoteConfigs: [[url: 'https://github.com/xxwvlyx/sysDevLabs']]
                ])
            }
        }

        stage('Build DEB') {
            steps {
                sh '''
                dpkg-buildpackage -us -uc
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
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs.'
        }
    }
}

