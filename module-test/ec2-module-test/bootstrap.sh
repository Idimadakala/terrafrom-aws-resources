#!/bin/bash

# Update the system
#dnf update -y
sudo dnf remove -y podman buildah
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
#dnf install docker -y
#systemctl start docker
#systemctl enable docker