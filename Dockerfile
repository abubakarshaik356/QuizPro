# ===============================
# STAGE 1: Build fat JAR
# ===============================
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /build
COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# ===============================
# STAGE 2: Run application
# ===============================
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy the FAT JAR (Quiz-Pro.jar)
COPY --from=build /build/target/Quiz-Pro.jar app.jar

EXPOSE 10000

# 🔑 Explicit main class (NO MANIFEST REQUIRED)
CMD ["java", "-cp", "app.jar", "com.quizpro.controller.AppServer"]
