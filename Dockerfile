FROM cirrusci/flutter:2.1.0-12.1.pre

WORKDIR /usr/src/app

COPY . ./

RUN flutter build web

RUN pub global activate dhttpd

CMD ["dhttpd","--path", "build/web/"]