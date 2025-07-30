# Start from the official MySQL 8 image
FROM mysql:8.0-debian

# Install netcat, which we need for our health check server.
# The -y flag auto-confirms the installation.
RUN apt-get update && apt-get install -y netcat-openbsd

# Copy our startup script into the container's root directory
COPY start.sh /start.sh

# Make our startup script executable
RUN chmod +x /start.sh

# Set our script as the command to run when the container starts
CMD ["/start.sh"]