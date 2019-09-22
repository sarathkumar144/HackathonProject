FROM openjdk:8
WORKDIR /var/lib/jenkins/workspace
COPY ./customer-service/target/customer-service-0.0.1-SNAPSHOT.jar /var/lib/jenkins/workspace
COPY ./customer-interface/target/customer-interface-0.0.1-SNAPSHOT.jar /var/lib/jenkins/workspace
COPY ./customer-client-service/target/customer-client-service-0.0.1-SNAPSHOT.jar /var/lib/jenkins/workspace
COPY ./eureka-server/target/eureka-server-0.0.1-SNAPSHOT.jar /var/lib/jenkins/workspace
EXPOSE 8080
ENTRYPOINT ["java","-jar","customer-service-0.0.1-SNAPSHOT.jar"]
ENTRYPOINT ["java","-jar","customer-interface-0.0.1-SNAPSHOT.jar"]
ENTRYPOINT ["java","-jar","customer-client-service-0.0.1-SNAPSHOT.jar"]
ENTRYPOINT ["java","-jar","eureka-server-0.0.1-SNAPSHOT.jar"]
CMD ["-start"]

