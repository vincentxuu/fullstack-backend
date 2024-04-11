FROM ubuntu:latest AS build

RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean

COPY . /app

WORKDIR /app

RUN mvn clean package

FROM openjdk:17-jdk-slim

EXPOSE 8080

ENV SPRING_DATASOURCE_URL=jdbc:mysql://sql6.freesqldatabase.com:3306/sql6698288
ENV SPRING_DATASOURCE_USERNAME=sql6698288
ENV SPRING_DATASOURCE_PASSWORD=Lj9s8p5aYW
ENV SPRING_DATASOURCE_DRIVER_CLASS_NAME=com.mysql.cj.jdbc.Driver
ENV SPRING_JPA_HIBERNATE_DDL_AUTO=update

COPY --from=build /app/target/demo-1.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]