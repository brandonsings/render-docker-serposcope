FROM openjdk:17-jdk-slim

WORKDIR /opt/serposcope

# Install curl and download the latest jar
RUN apt-get update && apt-get install -y curl && \
    curl -L -o serposcope.jar https://serposcope.serphacker.com/download/2.12.0/serposcope-2.12.0.jar

EXPOSE 7134

# Set the persistent data directory
VOLUME /root/.serposcope

CMD ["java", "-Dserposcope.home=/root/.serposcope", "-jar", "serposcope.jar"]
