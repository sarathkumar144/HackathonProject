FROM openjdk:8
WORKDIR /root/Work/dockerimage 
COPY ./target/eureka-server-0.0.1-SNAPSHOT.jar /root/Work/dockerimage
EXPOSE 8761
ENTRYPOINT ["java","-jar","eureka-server-0.0.1-SNAPSHOT.jar"]
CMD ["-start"] 
