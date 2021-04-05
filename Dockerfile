FROM ubuntu:xenial

RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget python

# Set up new user
# RUN useradd -ms /bin/bash developer
# RUN usermod -aG sudo developer





WORKDIR /home/developer


# RUN groupadd flutterusers
# RUN gpasswd -a developer flutterusers
# make directory writable


# USER developer

# Getting Dart
# RUN sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
# RUN sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
# RUN apt-get update
# RUN apt-get install dart

# Getting Flutter
RUN git clone https://github.com/flutter/flutter.git

ENV PATH "$PATH:/home/developer/flutter/bin"

# RUN flutter precache

#RUN flutter doctor




# RUN chown -R developer:developer /home/developer
# RUN chmod -R u+w /home/developer

RUN flutter channel beta

RUN flutter upgrade

RUN flutter config --enable-web

COPY . ./
RUN chmod 775 '/home/developer'

# Build for web
# RUN flutter build web --release

# Build for iOS
RUN flutter build ios

# RUN pub global activate dhttpd

WORKDIR /home/developer/build/web

CMD ["python","-m","SimpleHTTPServer",  "8080"]