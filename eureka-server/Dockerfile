FROM openjdk:8
WORKDIR /var/lib/jenkins/workspace
COPY ./customer-interface/target/eureka-server-0.0.1-SNAPSHOT.jar /var/lib/jenkins/workspace
EXPOSE 8761
ENTRYPOINT ["java","-jar","eureka-server-0.0.1-SNAPSHOT.jar"]
CMD ["-start"]
