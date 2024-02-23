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
                    sh '''${scannerHome}/bin/sonar-scanner
                    -Dsonar.projectKey=valaxy17-key_twittertrend \
                   -Dsonar.projectName=twittertrend \
                   -Dsonar.projectVersion=1.0 \
                   -Dsonar.sources=src/ \
                   -Dsonar.java.binaries=target/test-classes/com/visualpathit/account/controllerTest/ \
                   -Dsonar.junit.reportsPath=target/surefire-reports/ \
                   -Dsonar.jacoco.reportsPath=target/jacoco.exec \
                   -Dsonar.java.checkstyle.reportPaths=target/checkstyle-result.xml'''
                }

            }
        }
    }
}