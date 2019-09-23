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

    stage('Build Project') {
        // build project via maven
        sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
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
        docker.withRegistry('http://34.69.248.141:8081/repository/dockerhostedrepo/', 'Nexus-Credentials') {
            dockerImage.push("${env.BUILD_NUMBER}")
        }
        echo "Trying to push docker image to nexus"
    }

    stage('Run Image'){
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            dockerImage.run()
        }

    }

}
