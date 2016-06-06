FROM resin/rpi-raspbian:jessie

MAINTAINER Josh Williams <vmizzle@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
	mumble-server && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /opt/mumble/conf /opt/mumble/data /opt/mumble/bin

RUN cp /etc/mumble-server.ini /opt/mumble/conf/mumble-server.ini

RUN sed -i \
	'/^#\?database=.*$/s/^.*$/database=\/opt\/mumble\/data\/mumble-server.sqlite/g' \
	/opt/mumble/conf/mumble-server.ini && \
	sed -i \
	'/^#\?ice=.*$/s/^.*/ice="tcp -h 0.0.0.0 -p 6502"/g' \
	/opt/mumble/conf/mumble-server.ini

VOLUME /opt/mumble/data /opt/mumble/conf

COPY start_mumble.sh /opt/mumble/bin

ENTRYPOINT ["/opt/mumble/bin/start_mumble.sh"]
