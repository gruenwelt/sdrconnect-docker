# sdrconnect-server-docker

A Docker container that runs **SDRConnect** from SDRPlay.

Tested to run on Orange Pi Zero 2W and RSP1a and remote connected from a Mac with SDRconnect installed. Should be able to run on other arm64 single-board computers like Raspberry Pi or other linux computers.

---

## 📦 Prerequisites

- A Linux system
- A SDRPlay device such as RSP1a
- Another device such as Mac or PC with a SDRconnect software installed for remote connection.
- The sdrconnect installer file `sdrconnect*.run` downloaded from https://sdrplay.com/download and placed in the same folder as the Dockerfile

---

## 🏗️ Build the Docker image
```bash
docker build -t sdrconnect-server .
```
---

## 🚀 Run the container
```bash
docker run -d \
  --name sdrconnect-server-container \
  --device /dev/bus/usb \
  -p 50000:50000 \
  --restart unless-stopped \
  sdrconnect-server
```

---

## 👉 Notes

- You must manually download and provide the `sdrconnect*.run` file.
- The container exposes port 50000 for remote connection from SDRconnect on your other devices such as Mac or PC.
