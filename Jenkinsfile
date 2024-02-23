pipeline {
    agent {
        node {
            label 'maven'
        }
    }
environment {
    PATH = "/opt/apache-maven-3.9.6/bin:$PATH"
    PATH_JAVA = "/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin:$PATH_JAVA"
}
    stages {
        stage("build"){
            steps {
                  sh 'mvn clean deploy -Dmaven.test.skip=true'
            }
        }
        stage("SonarQube Ananlysis") {
            environment {
                scannerHome = tool 'valaxy-sonar-scanner'
            }
            steps {
                withSonarQubeEnv('valaxy-sonarqube-server') {
                    sh "${scannerHome}/bin/sonar-scanner"

                }

            }
        }
    }
}