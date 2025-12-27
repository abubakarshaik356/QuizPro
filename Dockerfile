# Use official Java image
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy Maven build output
COPY target/*.jar app.jar

# Expose port (Render uses 10000 internally)
EXPOSE 10000

# Run the app
CMD ["java", "-jar", "app.jar"]
