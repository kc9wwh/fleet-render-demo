#!/bin/bash

# Start the original MySQL entrypoint script in the background.
# This is the command that officially starts the MySQL server.
/entrypoint.sh mysqld &

# Wait a few seconds to give MySQL a moment to initialize.
sleep 15

# Start a minimal HTTP server on port 10000 in the foreground.
# This loop will keep the container alive and respond to health checks.
echo "Starting health check server..."
while true; do
  echo -e "HTTP/1.1 200 OK\n\nMySQL container is running." | nc -l -p 10000
done