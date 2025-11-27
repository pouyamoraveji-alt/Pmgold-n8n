FROM n8nio/n8n:latest

USER node

WORKDIR /home/node/app

COPY keepalive.js .

# اجرای همزمان n8n و keepalive بدون sh
CMD node keepalive.js & node /usr/local/lib/node_modules/n8n/bin/n8n
