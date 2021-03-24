pipeline {
    agent any
    environment {
        MYSQL_ROOT_PASSWORD = credentials("MYSQL_ROOT_PASSWORD")
    }
    stages {
        stage("Build"){
            sh "docker-compose build --parallel"
        }
        stage("Push"){
            sh "docker-compose push"
        }
        stage("Deploy"){
            sh "docker-compose up -d"
        }
    }
}