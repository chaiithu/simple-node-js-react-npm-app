 pipeline {
    agent any
    stages {
        stage ('scm') {
            steps {
                script {
                  checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/chaiithu/simple-node-js-react-npm-app.git']])
                }
            }
        }
        stage ('build and tag') {
            steps {
                script {
                    sh'''docker build -t chaithu .
                         docker tag chaithu chaithuchaithanya/node'''
                }
            }
        }
        stage ('push') {
            steps {
                script {
                 withDockerRegistry(credentialsId: 'docker_cred', url: '') {  
                       sh'''docker push chaithuchaithanya/node'''
                }
            }
        }
        }
        stage ('deploy') {
            steps {
                script {
                    sh'''docker run -d -p 8090:3000 --name poori chaithu'''
                }
            }
        }
    }
}
