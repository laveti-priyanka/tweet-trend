pipeline {
    agent {
        node {
            label 'maven'
        }
    }
environment {
    PATH = "/opt/apache-maven-3.9.6/bin:$PATH"
     SONARSERVER = 'valaxy-sonarqube-serverr'
     SONARSCANNER = 'valaxy-sonar-scannerr'
}
   stages {
        stage("build"){
            steps {
                 echo "----------- build started ----------"
                sh 'mvn clean deploy -Dmaven.test.skip=true'
                 echo "----------- build complted ----------"
            }
        }
        stage("test"){
            steps{
                echo "----------- unit test started ----------"
                sh 'mvn surefire-report:report'
                 echo "----------- unit test Complted ----------"
            }
        }

        stage('SonarQube analysis') {
            environment {
                    scannerHome = tool "${SONARSCANNER}"
                 }
                    steps{
                       withSonarQubeEnv("${SONARSERVER}") { // If you have configured more than one global server connection, you can specify its name
                        sh "${scannerHome}/bin/sonar-scanner"
    }
    }
  }
   }
}