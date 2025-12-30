FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk
WORKDIR /app

# FAT JAR
COPY --from=build /build/target/Quiz-Pro.jar app.jar

# JSPs
COPY --from=build /build/src/main/webapp /app/webapp

EXPOSE 10000
CMD ["java", "-cp", "app.jar", "com.quizpro.controller.AppServer"]
