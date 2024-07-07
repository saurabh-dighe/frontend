pipeline {
    agent { label 'ws' } 

    options {
        ansiColor('xterm')
        buildDiscarder(logRotator(numToKeepStr: '5')) 
        disableConcurrentBuilds()
        timeout(time: 50, unit: 'MINUTES')
    }
    parameters {
        choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Select the environment')
    }
    stages {
        stage('Deploying Frontend'){
            steps{
                dir('VPC') {
                git branch: 'main', url: 'https://github.com/saurabh-dighe/frontend.git'
                    sh '''
                        echo "Updating kubeconfig"
                        aws eks update-kubeconfig --name dev-eks-cluster
                        kubectl apply -f deploy.yml
                        sleep 20
                        kubectl get pods
                    '''
                }
            }
        }
    }
}