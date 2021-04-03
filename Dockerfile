FROM ubuntu:xenial

WORKDIR /usr/src/app

RUN git clone https://github.com/flutter/flutter.git

RUN export PATH="$PATH:`pwd`/flutter/bin"

RUN flutter precache

RUN flutter sdk-path

RUN flutter doctor

COPY . ./

RUN flutter build web

RUN pub global activate dhttpd

CMD ["dhttpd","--path", "build/web/"]