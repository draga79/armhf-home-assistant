FROM resin/rpi-raspbian
MAINTAINER Stefano Marinelli <stefano@dragas.it>

# Base layer
ENV ARCH=armv7l
ENV CROSS_COMPILE=/usr/bin/

RUN apt-get update &&     apt-get install --no-install-recommends       build-essential python3-dev python3-pip       libffi-dev libpython-dev libssl-dev       libudev-dev       net-tools nmap       iputils-ping libxslt-dev libxml2-dev python3-lxml  ssh &&     apt-get clean &&     rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Mouting point for the user's configuration
VOLUME /config

# Start Home Assistant
CMD [ "python3", "-m", "homeassistant", "--config", "/config" ]

# Install Home Assistant
RUN pip3 install homeassistant==0.72.1 ; rm -Rf /root/.cache/
