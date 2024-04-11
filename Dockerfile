FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/fullstack-backend-0.0.1-SNAPSHOT.jar fullstack-backend.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","fullstack-backend.jar"]

ENV SPRING_DATASOURCE_URL=jdbc:mysql://sql6.freesqldatabase.com:3306/sql6698288
ENV SPRING_DATASOURCE_USERNAME=sql6698288
ENV SPRING_DATASOURCE_PASSWORD=Lj9s8p5aYW
ENV SPRING_DATASOURCE_DRIVER_CLASS_NAME=com.mysql.cj.jdbc.Driver
ENV SPRING_JPA_HIBERNATE_DDL_AUTO=update
