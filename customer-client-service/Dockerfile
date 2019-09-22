FROM openjdk:8
WORKDIR /var/lib/jenkins/workspace
COPY ./customer-interface/target/customer-client-service-0.0.1-SNAPSHOT.jar /var/lib/jenkins/workspace
EXPOSE 8080
ENTRYPOINT ["java","-jar","customer-client-service-0.0.1-SNAPSHOT.jar"]
CMD ["-start"] 
