FROM ubuntu:xenial

RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget

# Set up new user
RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer

RUN git clone https://github.com/flutter/flutter.git

ENV PATH "$PATH:/home/developer/flutter/bin"

RUN flutter precache

RUN flutter sdk-path

RUN flutter doctor


COPY . ./

RUN flutter build web

RUN pub global activate dhttpd

CMD ["dhttpd","--path", "build/web/"]