FROM ubuntu:xenial

RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget ruby-full

WORKDIR /usr/local

RUN chmod 775 '/usr/local'
RUN chmod 775 '/home/'


RUN addgroup --gid 1040 developer
RUN adduser --disabled-password --gecos '' --uid 10401 --gid 1040 developer
USER developer

# Getting Homebrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


RUN brew install fastlane

# RUN curl -sSL https://get.rvm.io | bash -s stable
# RUN rvm install 2.7
# RUN rvm use 2.7
# RUN gem install fastlane -NV

# Getting Fastlane
# RUN gem install fastlane



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