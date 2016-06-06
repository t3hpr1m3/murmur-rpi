#!/bin/bash

if [[ ! -z "${MURMUR_SUPW}" ]]; then
	murmurd -supw $MURMUR_SUPW
fi

# Ensure the mumble-server user owns the required directories/files
chown -R mumble-server: /opt/mumble

exec murmurd -fg -ini /opt/mumble/conf/mumble-server.ini
