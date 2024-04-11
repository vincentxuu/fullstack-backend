FROM ubuntu:latest AS build

RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean

COPY . /app

WORKDIR /app

RUN mvn clean package

FROM openjdk:17-jdk-slim

EXPOSE 8080

COPY --from=build /app/target/demo-1.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]