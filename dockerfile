FROM n8nio/n8n:latest-with-node-20

USER node

# پوشه برای اسکریپت
WORKDIR /home/node/app
COPY keepalive.js ./keepalive.js

# اجرای همزمان KeepAlive و n8n
CMD ["bash", "-c", "node keepalive.js & n8n start"]
