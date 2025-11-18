#!/usr/bin/env bash

# Update
sudo apt-get update

# Install desktop + VNC server + noVNC
sudo apt-get install -y xfce4 xfce4-goodies novnc websockify tightvncserver

# Install Android emulator dependencies
sudo apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

# Install system image
yes | sdkmanager --install "system-images;android-34;google_apis;x86_64"

# Create AVD
echo "no" | avdmanager create avd -n codespace -k "system-images;android-34;google_apis;x86_64" --device "pixel"

# Configure VNC password
mkdir -p ~/.vnc
echo "pass" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd
