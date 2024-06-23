FROM openjdk:21-jdk-slim-bullseye AS build-env
COPY build/libs/*.jar /app/
WORKDIR /app


# FROM gcr.io/distroless/java11-debian11:latest
FROM gcr.io/distroless/java21-debian12:debug
COPY --from=build-env /app /app
WORKDIR /app
ENTRYPOINT ["java", "-jar", "springbootstudy-1.1-SNAPSHOT.jar"]

ENV HGB_JDBC_HOST=localhost
ENV HGB_JDBC_PORT=5432
ENV HGB_JDBC_DB=hgb
ENV HGB_JDBC_USER=hgb
ENV HGB_JDBC_PASSWORD=hgb
ENV HGB_JDBC_URL=jdbc:postgresql://${HGB_JDBC_HOST}:${HGB_JDBC_PORT}/${HGB_JDBC_DB}