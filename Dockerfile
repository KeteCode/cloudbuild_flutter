FROM ubuntu:xenial

RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install tar \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://storage.googleapis.com/flutter_infra/releases/beta/linux/flutter_linux_2.1.0-12.2.pre-beta.tar.xz

RUN tar xf flutter_linux_2.1.0-12.2.pre-beta.tar.xz

RUN export PATH="$PATH:`pwd`/flutter/bin"

RUN flutter precache

RUN flutter sdk-path

RUN flutter doctor

WORKDIR /usr/src/app

COPY . ./

RUN flutter build web

RUN pub global activate dhttpd

CMD ["dhttpd","--path", "build/web/"]