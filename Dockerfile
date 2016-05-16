FROM ubuntu:trusty
MAINTAINER John Kelly <john.m.kelly@cdk.com>

# Prevent dpkg errors
ENV TERM=xterm-256color

RUN apt-get update && \
    apt-get install -y \
    -o APT::Install-Recommend=false -o APT::Install-Suggests=false \
    python python-virtualenv

RUN virtualenv /appenv && \
    . /appenv/bin/activate && \
    pip install pip --upgrade

ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
