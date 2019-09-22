FROM openjdk:8
WORKDIR /root/Work/dockerimage 
COPY ./target/customer-client-service-0.0.1-SNAPSHOT.jar /root/Work/dockerimage
EXPOSE 8080
ENTRYPOINT ["java","-jar","customer-client-service-0.0.1-SNAPSHOT.jar"]
CMD ["-start"] 
