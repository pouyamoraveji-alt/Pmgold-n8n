FROM n8nio/n8n:latest

ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0

# Ensure we have permission to set file mode
USER root
COPY keepalive.sh /keepalive.sh
RUN chmod +x /keepalive.sh

# (optional) switch back to non-root user if the base image defines one
# e.g. USER node   <-- only add if you know the original username
# If you don't switch back, n8n may still run fine as root, but it's less ideal.

EXPOSE 5678

CMD ["/bin/sh", "-c", "sh /keepalive.sh & n8n start"]
