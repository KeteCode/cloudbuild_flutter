FROM ubuntu:xenial

# RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget
# RUN apt update && apt install setfacl
# Set up new user
RUN useradd -ms /bin/bash developer
RUN usermod -aG sudo developer





WORKDIR /home/developer


RUN groupadd flutterusers
RUN gpasswd -a developer flutterusers
# make directory writable
RUN chmod 775 '/home/developer'

USER developer

RUN git clone https://github.com/flutter/flutter.git

ENV PATH "$PATH:/home/developer/flutter/bin"

# RUN flutter precache

#RUN flutter doctor


COPY . ./

# RUN chown -R developer:developer /home/developer
# RUN chmod -R u+w /home/developer

RUN flutter channel beta

RUN flutter upgrade

RUN flutter config --enable-web

RUN flutter build web --release

RUN pub global activate dhttpd

CMD ["dhttpd","--path", "build/web/"]