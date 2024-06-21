pipeline {
    
    agent any
    
    tools {
        nodejs 'nodejs-16'
    }
    
    stages {
        stage('GIT Checkout') {
            steps{
                git credentialsId: 'GitHub-credentials', url: 'https://github.com/kosaraju3333/portal-app.git'
            }
        }
        
        stage('Portal-app-Build') {
            steps {
                sh "npm init -y"
                sh "npm i express.js body-parser knex pg nodemon"
            }
        }
        
        stage('Downloading portal-app.js from AWS') {
            steps {
               sh  "aws s3 cp s3://portal-spontansolutions/secrets/portal-app.js ."
            }
        }
        
        stage('Creating Artifact') {
            steps {
                sh "sudo tar -czf portal-spontan.tar.gz node_modules package.json public portal-app.js"
            }
        }
        
        stage('Copying Artifact and extracting to app EC2 server') {
            steps {
                script {
                    sshPublisher(publishers: [sshPublisherDesc(configName: 'Portal-app-Server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'tar -xvf portal-app/portal-spontan.tar.gz -C portal-app', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'portal-app', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'portal-spontan.tar.gz')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
                }
            }
                
        }
        
        stage('restaring Portal app') {
            steps {
                script {
                    sshPublisher(publishers: [sshPublisherDesc(configName: 'Portal-app-Server', transfers: [ sshTransfer(execCommand: 'pm2 restart portal-app/portal-app.js')])])

                }
            }
        }
        
        stage('removing TAR artifact from ec2 VM') {
            steps {
                script {
                    sshPublisher(publishers: [sshPublisherDesc(configName: 'Portal-app-Server', transfers: [ sshTransfer(execCommand: 'rm -rf portal-app/portal-spontan.tar.gz')])])

                }
            }
        }
    }
        
}
