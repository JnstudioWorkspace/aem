#!/usr/bin/env bash

sudo apt update -y

# Install desktop UI + VNC + noVNC
sudo apt install -y xfce4 xfce4-goodies tightvncserver novnc websockify

# Install emulator dependencies
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils mesa-utils

# Install Android system image
yes | sdkmanager --install "system-images;android-34;google_apis;x86_64"

# Create AVD
echo "no" | avdmanager create avd -n codespace -k "system-images;android-34;google_apis;x86_64" --device "pixel"

# Set VNC password
mkdir -p ~/.vnc
echo "pass" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd
