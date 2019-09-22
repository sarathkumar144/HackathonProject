FROM openjdk:8
WORKDIR /var/lib/jenkins/workspace
#/root/Work/dockerimage 
COPY ./customer-interface/target/customer-interface-0.0.1-SNAPSHOT.jar /var/lib/jenkins/workspace
EXPOSE 8080
ENTRYPOINT ["java","-jar","customer-interface-0.0.1-SNAPSHOT.jar"]
CMD ["-start"] 
