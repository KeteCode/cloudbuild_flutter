FROM ubuntu:xenial

RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget ruby-full 

WORKDIR /usr/local

RUN chmod 777 '/usr/local'
RUN chmod 777 '/home/'
RUN chmod 777 '/var/lib/dpkg/'


RUN addgroup --gid 1040 developer
RUN adduser --disabled-password --gecos '' --uid 10401 --gid 1040 developer
USER developer



# Getting Android SDK
WORKDIR /home/developer

# # Prepare Android directories and system variables
# RUN mkdir -p Android/sdk
# ENV ANDROID_SDK_ROOT /home/developer/Android/sdk
# RUN mkdir -p .android && touch .android/repositories.cfg

# # Set up Android SDK
# RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
# RUN unzip sdk-tools.zip && rm sdk-tools.zip
# RUN mv tools Android/sdk/tools
# RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
# RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
# ENV PATH "$PATH:/home/developer/Android/sdk/platform-tools"


# Getting Homebrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
ENV PATH "$PATH:/home/linuxbrew/.linuxbrew/bin"
ENV PATH "$PATH:/home/linuxbrew/.linuxbrew/bin/brew"

# RUN echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/developer/.profile
# RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# WORKDIR /usr/local
# USER root

# RUN test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
# RUN test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# RUN test -r ~/.profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
# RUN echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

# ENV PATH "$PATH:/home/developer/.linuxbrew/bin"
# ENV PATH "$PATH:/home/developer/.linuxbrew/bin/brew"

# RUN apt update && apt install -y linuxbrew-wrapper build-essential

RUN brew doctor

USER developer

# RUN brew install fastlane

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