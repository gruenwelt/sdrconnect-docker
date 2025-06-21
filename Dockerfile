FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    libusb-1.0-0 \
    libglib2.0-0 libxcb1 libx11-6 libxext6 libxrender1 \
    libxrandr2 libxfixes3 libxi6 libxtst6 libnss3 \
    libasound2 libxss1 ca-certificates xz-utils wget && \
    rm -rf /var/lib/apt/lists/*

COPY SDRconnect_linux-arm64_*.run /opt/installer.run

RUN chmod +x /opt/installer.run && \
    /opt/installer.run --noexec --target /opt/sdr_unpacked && \
    mv /opt/sdr_unpacked/* /opt/sdrconnect

# Make sure all .so libraries have execute permissions
RUN chmod +x /opt/sdrconnect/* && \
    ln -s /opt/sdrconnect/SDRconnect /usr/local/bin/sdrconnect

# Set runtime library path so embedded .so files are found
ENV LD_LIBRARY_PATH=/opt/sdrconnect:$LD_LIBRARY_PATH

WORKDIR /opt/sdrconnect

CMD ["sdrconnect", "--server"]
