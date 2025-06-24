# Stage 1: Build and unpack SDRconnect
FROM ubuntu:22.04 AS builder

RUN apt-get update && apt-get install -y \
    xz-utils wget

COPY SDRconnect*.run /opt/installer.run

RUN chmod +x /opt/installer.run
RUN /opt/installer.run --noexec --target /opt/sdr_unpacked && \
    rm /opt/installer.run

# Stage 2: Minimal runtime image
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    libusb-1.0-0 libasound2 libuuid1 libicu72 libglib2.0-0 libxcb1 libx11-6 libxext6 \
    libxrender1 libxrandr2 libxfixes3 libxi6 libxtst6 libnss3 libxss1 ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /opt/sdr_unpacked /opt/sdrconnect

RUN ln -s /opt/sdrconnect/SDRconnect /usr/local/bin/sdrconnect

WORKDIR /opt/sdrconnect

ENTRYPOINT ["sdrconnect", "--server"]
