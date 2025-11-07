# Stage 1: Build the application (using a multi-stage build)
FROM maven:3.8.7-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src /app/src
RUN mvn clean package -DskipTests

# Stage 2: Create the final, lightweight image
FROM openjdk:17-jre-slim
# Create a non-root user for security
RUN groupadd --system appuser && useradd --system -g appuser appuser
USER appuser
# Copy the built JAR from the 'build' stage
COPY --from=build /app/target/*.jar app.jar
# Expose the port (default for Spring Boot)
EXPOSE 8080
# Define the entry point to run the application
ENTRYPOINT ["java","-jar","/app.jar"]

