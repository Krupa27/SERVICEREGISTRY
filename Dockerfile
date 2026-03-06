FROM openjdk:17-jdk-slim
WORKDIR /app
COPY mvnw pom.xml ./
COPY .mvn .mvn
RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline -B
COPY src ./src
RUN ./mvnw package -DskipTests
EXPOSE 8761
CMD ["java", "-jar", "target/server-registry-0.0.1-SNAPSHOT.jar"]