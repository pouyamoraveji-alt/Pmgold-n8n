FROM n8nio/n8n:latest

USER node

WORKDIR /home/node/app
COPY keepalive.js ./keepalive.js

CMD ["sh","-c","node keepalive.js & n8n start"]
