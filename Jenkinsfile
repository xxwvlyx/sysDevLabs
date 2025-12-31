pipeline {
    agent any
    environment {
        WORKDIR = "${env.WORKSPACE}"
    }
    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'master', url: 'https://github.com/xxwvlyx/sysDevLabs'
            }
        }
        stage('Prepare Files') {
            steps {
                sh 'cp -r ~/Desktop/copyfileEtc/* ${WORKDIR}/'
                sh 'mkdir -p ${WORKDIR}/scripts'
                sh 'cp ~/Desktop/script.bash ${WORKDIR}/scripts/script.bash'
                sh 'chmod +x ${WORKDIR}/scripts/script.bash'
            }
        }
        stage('Build DEB') {
            steps {
                sh 'dpkg-buildpackage -us -uc || true'
            }
        }
        stage('Run Script') {
            steps {
                sh './scripts/script.bash || echo "Script failed, but pipeline continues"'
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished'
        }
    }
}
