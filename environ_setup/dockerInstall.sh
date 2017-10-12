#!/bin/bash

# install Docker & NVIDIA-Docker
# pre-install
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
# obtain and install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update && apt-get upgrade -y
apt-get install -y docker-ce

# get and install Nvidia-Docker
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

# test if nvidia-smi works from a docker container
nvidia-docker run --rm nvidia/cuda nvidia-smi

# obtain some popular images
nvidia-docker pull nvidia/cuda
nvidia-docker pull nvidia/caffe
nvidia-docker pull nvidia/digits
nvidia-docker pull microsoft/cntk
nvidia-docker pull tensorflow/tensorflow:latest-gpu-py3

# obtain images built and maintained by Honghu-Tech
nvidia-docker pull honghu/keras:latest-gpu-py3