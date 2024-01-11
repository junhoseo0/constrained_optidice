#!/bin/bash

# Install APT packages.
apt-get update && apt-get install -y cmake

# Install PIP packages.
pip install -U pip && \
pip install wheel==0.38.4 setuptools==65.5.0 && # Workaround for old OpenAI Gym. \ 
pip install -r requirements.txt
