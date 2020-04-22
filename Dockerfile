FROM debian:sid-slim

LABEL maintainer="Matthieu Bargheon <bh@bhtech.io>"
LABEL git="https://github.com/bh42/docker-transmission"
LABEL version="0.1"

VOLUME ["/downloads"]

RUN apt-get update -y \
  && apt-get upgrade -y

RUN apt-get update -y \
  && apt-get install -y \
  transmission \
  transmission-daemon \
  && rm -rf /var/lib/apt/lists/*

RUN chmod 1777 /downloads

EXPOSE 9091 51413

COPY entrypoint.sh /root/

ENTRYPOINT ["/root/entrypoint.sh"]
