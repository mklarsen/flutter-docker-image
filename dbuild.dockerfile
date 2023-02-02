FROM ubuntu:20.04 as builder

# Prerequisites
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Copenhagen

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget

# Set up new user
RUN useradd -ms /bin/bash flutter
RUN mkdir -p /home/flutter
RUN chown flutter:flutter /home/flutter

COPY ./DOTgitconfig /home/flutter/.gitconfig
RUN chown flutter:flutter /home/flutter/.gitconfig

USER flutter
WORKDIR /home/flutter

# Prepare Android directories and system variables
RUN mkdir -p Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/sdk/tools
RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
ENV PATH "$PATH:/home/flutter/Android/sdk/platform-tools"

# Installing Flutter SDK
RUN git clone -v https://github.com/flutter/flutter.git

ENV PATH "$PATH:/home/flutter/flutter/bin"
RUN cd /home/flutter/flutter/bin; git checkout 3.0.5

RUN dart --version
RUN flutter doctor

FROM builder
WORKDIR /stage/
##COPY / ./

CMD []

#EOF
