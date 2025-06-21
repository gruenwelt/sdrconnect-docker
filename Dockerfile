# Use Ubuntu 22.04 base image for ARM64
FROM ubuntu:22.04

# Install required dependencies for SDRconnect
RUN apt-get update && apt-get install -y \
    libglib2.0-0 libxcb1 libx11-6 libxext6 libxrender1 \
    libxrandr2 libxfixes3 libxi6 libxtst6 libnss3 \
    libasound2 libxss1 ca-certificates xz-utils wget && \
    rm -rf /var/lib/apt/lists/*

# Copy the SDRconnect installer to the container
COPY SDRconnect_linux-arm64_83273bcd8_1.run /opt/sdrconnect.run

# Make the installer executable and run the full silent install
RUN chmod +x /opt/sdrconnect.run && \
    /opt/sdrconnect.run --quiet --accept --target /opt/sdrconnect

# Make the SDRconnect binary executable and symlink it
RUN chmod +x /opt/sdrconnect/sdrconnect && \
    ln -s /opt/sdrconnect/sdrconnect /usr/local/bin/sdrconnect

# Set working directory
WORKDIR /opt/sdrconnect

# Default command to launch SDRconnect
CMD ["sdrconnect"]
