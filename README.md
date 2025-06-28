# sdrconnect-server-docker

A Dockerized build and runtime environment for **SDRConnect** from SDRPlay.

This setup runs efficiently even on compact ARM64 single-board computers such as the Raspberry Pi, ensuring broader accessibility and ease of use for common DIY and SDR projects. Thanks to Docker-based isolation, it is also portable and can be deployed on a broad range of systems, including desktops and standard Linux servers.

---

## 📌 Version

**v1.0.0** — Initial release with Docker  
**Tested on**: Orange Pi Zero 2W (4GB RAM) and Banana Pi W4 Zero (2GB RAM) + SDRplay RSP1A; and connected from client software SDRconnect

---

## 📦 Requirements

- A Linux system
- SDRplay hardware (e.g., RSP1A)
- Client software SDRconnect
- SDRconnect installer for Linux  
  👉 Downloaded from [SDRplay.com](https://www.sdrplay.com/downloads/)

---

## 🏗️ Build Instructions

1. Clone this repository:

   ```bash
   git clone https://github.com/gruenwelt/sdrconnect-server-docker
   cd sdrconnect-server-docker
   ```

2. Download the `SDRconnect*.run` file and place it in the root of this repo.

3. Build and run the container:

   ```bash
   docker compose up -d
   ```

---

## 👉 Notes

- Port `50000` must be open and mapped for clients to connect.
- Docker build skips the interactive menu in the `SDRconnect*.run` file which also displays the licence terms of using that software. Please install the software once manually to read the licence as the build script auto-accepts it on your behalf.

---
