FROM openjdk:17-jdk-slim

WORKDIR /opt/serposcope

# Download the correct version from the new URL
RUN apt-get update && apt-get install -y curl && \
    curl -L -o serposcope.jar https://www.serposcope.com/downloads/2.15.0/serposcope-2.15.0.jar

EXPOSE 7134

# Define persistent data volume
VOLUME /root/.serposcope

# Run Serposcope with home directory set to persistent volume
CMD ["java", "-Dserposcope.home=/root/.serposcope", "-jar", "serposcope.jar"]
