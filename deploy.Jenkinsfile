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
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Action to perform')
    }
    stages {
        stage('Deploying Frontend'){
            steps{
                dir('VPC') {
                    sh "rm -rf ./VPC/*"
                git branch: 'main', url: 'https://github.com/saurabh-dighe/terraform-vpc.git'
                    sh '''
                        rm -rf
                        terrafile -f ./env-dev/Terrafile
                        terraform init --backend-config=env-${ENV}/backend-${ENV}.tfvars -reconfigure
                        terraform plan -var-file=env-${ENV}/${ENV}.tfvars -var ENV=${ENV}
                        terraform ${ACTION} -auto-approve -var-file=env-${ENV}/${ENV}.tfvars 
                    '''
                }
            }
        }
    }
}