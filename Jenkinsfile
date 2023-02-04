pipeline{
    agent any
    environment {
        password = credentials('dockerhub-pwd')
    }
    tools{
        maven 'maven_3_5_0'
    }
    stages{
        stage('Crear Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/JeanTorresGeek/FinalDevOps']])
                bat 'mvn clean install'
            }
        }
        stage('Crear imagen en docker'){
            steps{
                script{
                    bat 'docker build -t jeantorresgeek/finaldevops:v1 .'
                }
            }
        }
        stage('Subiendo imagen a docker hub'){
            steps{
                bat 'docker login -u jeantorresgeek -p Z9#fG8xTPzJqwAG'
                bat 'docker push jeantorresgeek/finaldevops:v1'
            }
        }
        stage('Levantando contenedor'){
            steps{
                bat "docker run --name final-devops -p 8085:8085 jeantorresgeek/finaldevops:v1"
            }
        }
    }
}