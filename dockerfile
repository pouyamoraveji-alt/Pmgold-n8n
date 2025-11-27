FROM n8nio/n8n:latest-with-node-20

USER node

# پوشه کاری و اسکریپت بیدارکننده
WORKDIR /home/node/app
COPY keepalive.js ./keepalive.js

# اجرای همزمان اسکریپت و n8n
CMD ["bash", "-c", "node keepalive.js & n8n start"]
