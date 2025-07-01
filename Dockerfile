FROM openjdk:17-jdk-slim

# Create a working directory
WORKDIR /opt/serposcope

# Download and run latest Serposcope release
RUN apt-get update && \
    apt-get install -y curl && \
    curl -L -o serposcope.jar https://serposcope.serphacker.com/download/2.12.0/serposcope-2.12.0.jar

EXPOSE 7134

# Data dir (for mounting persistence)
VOLUME /data

# Default command
CMD ["java", "-Dserposcope.home=/data", "-jar", "serposcope.jar"]
