FROM ubuntu:xenial

WORKDIR /usr/src/app

RUN sudo snap install flutter --classic

RUN flutter sdk-path

RUN flutter doctor

COPY . ./

RUN flutter build web

RUN pub global activate dhttpd

CMD ["dhttpd","--path", "build/web/"]