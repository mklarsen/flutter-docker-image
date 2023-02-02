<<<<<<< Updated upstream
# https://hub.docker.com/r/cirrusci/android-sdk
# https://github.com/cirruslabs/docker-images-android/blob/master/sdk/33/Dockerfile
ARG android_sdk_ver=33
FROM cirrusci/android-sdk:${android_sdk_ver}

ARG flutter_ver=3.7.1
=======
FROM ubuntu:20.04

# Prerequisites
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Copenhagen

ARG flutter_ver=3.3.8
ARG android_sdk_ver=30
>>>>>>> Stashed changes
ARG build_rev=0

ENV ANDROID_SDK_ROOT /home/flutter/Android/sdk
ENV PATH "$PATH:/home/flutter/Android/sdk/platform-tools"

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends --no-install-suggests \
      ca-certificates \
 && update-ca-certificates \
    \
 # Install dependencies for Linux toolchain
 && apt-get install -y --no-install-recommends --no-install-suggests \
            build-essential \
            clang cmake \
            lcov \
            libgtk-3-dev liblzma-dev \
            ninja-build \
            pkg-config \
            tzdata curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget iputils-ping

# Set up new user
RUN useradd -ms /bin/bash flutter

USER flutter
WORKDIR /home/flutter

# Prepare Android directories and system variables
RUN mkdir -p Android/sdk

RUN mkdir -p .android && touch .android/repositories.cfg

# Set up Android SDK
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/sdk/tools
RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"


# Install Flutter itself
RUN curl -fL -o /tmp/flutter.tar.xz \
  https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${flutter_ver}-stable.tar.xz \
  && tar -xf /tmp/flutter.tar.xz -C /home/flutter/

#RUN (yes | flutter doctor --android-licenses)

#USER flutter
#RUN git config --global --add safe.directory /home/flutter/

USER flutter
WORKDIR /home/flutter

#CMD bash
