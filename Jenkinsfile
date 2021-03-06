node {
    // reference to maven
    def mvnHome = tool 'localMaven'

    // holds reference to docker image
    def dockerImage
    // ip address of the docker private repository(nexus)


    stage('Clone Repo') { // for display purposes
        // Get some code from a GitHub repository
        git poll: true, url: 'https://github.com/sarathkumar144/HackathonProject.git'

        mvnHome = tool 'localMaven'
    }
    stage('Execute Unit Tests') {
        // build project via maven
        sh "'${mvnHome}/bin/mvn' clean test"
    }

    stage('Build Project') {
        // build project via maven
        sh "'${mvnHome}/bin/mvn' clean package"
    }
    
    stage('SonarQube analysis') { 
        withSonarQubeEnv('localSonar') { 
          sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.3.0.603:sonar '
        }
    }


    stage('Build image') {
         dockerImage = docker.build("sarathkumar14/eureka-server:${env.BUILD_ID}")
    }


    stage('Push image') {
        docker.withRegistry('http://34.69.248.141:8123/repository/HackathonDockerRepo/', 'nexus-credentials') {
            dockerImage.push("${env.BUILD_NUMBER}")
        }
        echo "Trying to push docker image to nexus"
    }
    
    stage('Push Tags to Github'){
    withCredentials([usernamePassword(credentialsId: 'GitHubCredentials', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
   sh("git tag -a ${env.BUILD_NUMBER} -m 'Jenkins'")
    sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/sarathkumar144/HackathonProject.git --tags')
}
    }
    
 }
