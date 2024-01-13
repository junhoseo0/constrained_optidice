FROM tensorflow/tensorflow:2.7.0-gpu

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Etc/UTC

# Workaround for NVIDIA GPG Error.
# Detail: https://github.com/NVIDIA/nvidia-docker/issues/1632
RUN rm /etc/apt/sources.list.d/cuda.list \
    && rm /etc/apt/sources.list.d/nvidia-ml.list

# Install APT packages.
RUN apt-get update \
    && apt-get -y upgrade --with-new-pkgs \
    && apt-get -y install --no-install-recommends \
        # Common Tools
        cmake \
        git \
        vim \
        wget \
        # MuJoCo 200
        libosmesa6-dev \
        libgl1-mesa-glx \
        libglfw3 \
        libglew2.1 \
	libcairo2-dev \
    && apt-get clean

# Download MuJoCo200 Binary
RUN wget -q -O /tmp/mujoco.zip https://www.roboti.us/download/mujoco200_linux.zip \
    && mkdir /root/.mujoco \
    && unzip /tmp/mujoco.zip -d /root/.mujoco \
    && wget -q -O /root/.mujoco/mjkey.txt https://www.roboti.us/file/mjkey.txt

COPY requirements.txt /tmp/requirements.txt
RUN pip install -U pip \
    # Workaround for old OpenAI Gym.
    && pip install wheel==0.38.4 setuptools==65.5.0 \
    && pip install -r /tmp/requirements.txt
