FROM openjdk:8
WORKDIR /root/Work/dockerimage 
COPY ./target/customer-interface-0.0.1-SNAPSHOT.jar /root/Work/dockerimage
EXPOSE 8080
ENTRYPOINT ["java","-jar","customer-interface-0.0.1-SNAPSHOT.jar"]
CMD ["-start"] 
