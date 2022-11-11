pipeline {
    agent any

    tools {
          maven 'M2_HOME'
          jdk 'JAVA_HOME'
    }
    parameters {
         string(name: 'tomcat_staging', defaultValue: '34.228.23.239', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: '34.201.251.141', description: 'Production Server')
         choice(name: 'Environment', choices: ['tomcat_staging', 'tomcat_prod'], description: 'Choose environment')
    }
    environment {
        EMAIL_APPROVER = '2022ht66017@wilp.bits-pilani.ac.in'
        VM_EMAIL_FROM = 'admin@jenkins'
        DEPLOY_CREDENTIALS = credentials('deployer_user')
    }

    triggers {
         pollSCM('* * * * *')
     }

stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving starts here...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ('Deploy to Staging environment'){
            steps {
                sshagent(['login_user']){
                    echo "Deploying with ${DEPLOY_CREDENTIALS}"
                    sh "scp -o StrictHostKeyChecking=no webapp/target/webapp.war ec2-user@$params.tomcat_staging:/opt/tomcat/webapps"
                }
            }
            post {
                success {
                    echo "Deployed successfully on Stage. See results in http://$params.tomcat_staging:8080/webapp/"
                }
            }
        }
        stage ("Deploy to Production environment"){
            input {
                    message "Proceed with Deployment on Production?"
                }
            steps {
                sshagent(['login_user']){
                    echo "Deploying with ${DEPLOY_CREDENTIALS}"
                    sh "scp -o StrictHostKeyChecking=no webapp/target/webapp.war ec2-user@$params.tomcat_prod:/opt/tomcat/webapps"
                }
            }
            post {
                success {
                    echo "Deployed successfully on Prod. See results in http://$params.tomcat_prod:8080/webapp/"
                }
            }
        }           
    }
}
