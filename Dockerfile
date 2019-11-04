FROM python:3.7-slim-buster

ENV LANG='C.UTF-8' LANGUAGE='C.UTF-8' LC_ALL='C.UTF-8'

# Add s6 script

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.22.1.0/s6-overlay-amd64.tar.gz /tmp
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

# Copy S6 init scripts

COPY s6/ /etc

# Add necessary packages

RUN apt update && apt install xz-utils tzdata bash curl -y

HEALTHCHECK  --timeout=3s CMD curl --fail http://localhost:5000 || exit 1  
EXPOSE 5000
VOLUME /config

ENTRYPOINT ["/init"]


