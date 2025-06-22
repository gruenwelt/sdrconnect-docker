# sdrconnect-docker-arm64

This is a Dockerized version of **SDRConnect** for ARM64 systems (e.g., Raspberry Pi, Orange Pi), created to help radio enthusiasts run SDRConnect easily on ARM64 devices.

> ⚠️ **Note:** This is community-driven effort to Dockerize SDRConnect for ARM64 systems.  
> ✅ Tested on Orange Pi Zero 2W, should ideally work on other Pis as well including Raspberry Pi.

---

## ✅ Features

- Runs SDRConnect Linux ARM64 installer inside a Docker container  
- Enables SDRplay RSP receivers usage on ARM64 devices without native installation  
- Minimal container with no systemd or sudo — designed for headless use  
- Community-supported build for easier deployment

---

## 📦 Prerequisites

- Docker installed on your ARM64 host device  
- SDRplay hardware connected and accessible  
- **SDRConnect installer file for Linux ARM64:**

  Download the official installer manually (due to licensing) from SDRplay’s website:

  👉 [SDRconnect_linux-arm64_83273bcd8_1.run](https://www.sdrplay.com/downloads/)

- **Important:** This installer file is **excluded from the repository** and must be placed manually in the root directory of this repo before building.

---

## 🏗️ Build Instructions

1. Download the SDRConnect installer `SDRconnect_linux-arm64_83273bcd8_1.run`  
2. Place the installer file at the root of this repository (next to the Dockerfile)  
3. Build the Docker image:

```bash
docker build -t sdrconnect_arm64 .
```

---

## 🚀 Run Example

```bash
docker run --rm \
  --device /dev/bus/usb \
  -p 5555:5555 \
  sdrconnect_server
```
