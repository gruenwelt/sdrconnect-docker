# Use Ubuntu 22.04 base image for ARM64
FROM ubuntu:22.04

# Install dependencies needed for SDRconnect
RUN apt-get update && apt-get install -y \
    libusb-1.0-0 libasound2 libuuid1 libicu70 libglib2.0-0 libxcb1 libx11-6 libxext6 libxrender1 \
    libxrandr2 libxfixes3 libxi6 libxtst6 libnss3 libxss1 ca-certificates xz-utils wget && \
    rm -rf /var/lib/apt/lists/*

# Copy the SDRconnect installer .run file to /opt // #change file name based on latest download
COPY SDRconnect_linux-arm64_83273bcd8.run /opt/installer.run

# Make the installer executable and extract SDRconnect files
RUN chmod +x /opt/installer.run && \
    /opt/installer.run --noexec --target /opt/sdr_unpacked && \
    mkdir -p /opt/sdrconnect && \
    mv /opt/sdr_unpacked/* /opt/sdrconnect && \
    rm -rf /opt/sdr_unpacked /opt/installer.run

# Make the SDRconnect executable runnable
RUN chmod +x /opt/sdrconnect/SDRconnect

# Create symbolic link for easy command line access
RUN ln -s /opt/sdrconnect/SDRconnect /usr/local/bin/sdrconnect

# Set working directory
WORKDIR /opt/sdrconnect

# Default command to run SDRconnect in server mode
CMD ["sdrconnect", "--server"]
