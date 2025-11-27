FROM n8nio/n8n:latest

ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0

COPY keepalive.sh /keepalive.sh
RUN chmod +x /keepalive.sh

EXPOSE 5678

CMD ["/bin/sh", "-c", "sh /keepalive.sh & n8n start"]