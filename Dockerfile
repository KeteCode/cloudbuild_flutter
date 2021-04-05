FROM ubuntu:xenial

RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget ruby-full

WORKDIR /home/developer

# Getting Homebrew
# RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Getting Fastlane
RUN gem install fastlane



# # Getting Flutter
# RUN git clone https://github.com/flutter/flutter.git

# ENV PATH "$PATH:/home/developer/flutter/bin"

# RUN flutter channel beta

# RUN flutter upgrade

# RUN flutter config --enable-web

# COPY . ./
# RUN chmod 775 '/home/developer'

# # Build for web
# RUN flutter build web --release

# WORKDIR /home/developer/build/web

# CMD ["python","-m","SimpleHTTPServer",  "8080"]