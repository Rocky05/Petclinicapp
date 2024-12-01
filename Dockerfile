# Dockerfile to build image of petclinic app using alpine distro #

FROM alpine:latest AS base
RUN apk add --no-cache git openjdk17-jdk
WORKDIR /website
RUN git clone https://github.com/spring-projects/spring-petclinic.git
RUN cd spring-petclinic && ./mvnw package -DskipTests
CMD ["java", "-jar", "/website/spring-petclinic/target/spring-petclinic-3.4.0-SNAPSHOT.jar"]
