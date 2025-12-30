# =======================
# STAGE 1: Build the JAR
# =======================
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /build

# Copy only required files
COPY pom.xml .
COPY src ./src

# Build executable JAR
RUN mvn clean package -DskipTests

# =======================
# STAGE 2: Run the app
# =======================
FROM eclipse-temurin:17-jdk

WORKDIR /app

# 🔑 COPY JAR FROM BUILD STAGE (NOT local machine)
COPY --from=build /build/target/*shaded*.jar app.jar


EXPOSE 10000

CMD ["java", "-cp", "app.jar", "com.quizpro.controller.AppServer"]

