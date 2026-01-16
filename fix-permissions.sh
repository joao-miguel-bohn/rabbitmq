#!/bin/bash
set -eo pipefail

# Fix cookie file permissions if it exists
if [ -f /var/lib/rabbitmq/.erlang.cookie ]; then
    chmod 600 /var/lib/rabbitmq/.erlang.cookie
    chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
fi

# Execute original entrypoint as rabbitmq user
exec docker-entrypoint.sh "$@"
