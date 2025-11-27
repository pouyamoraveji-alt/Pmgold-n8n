FROM n8nio/n8n:latest

# نصب curl برای KeepAlive
USER root
RUN apk add --no-cache curl

# ایجاد پوشه KeepAlive
RUN mkdir -p /keepalive
COPY keepalive.js /keepalive/keepalive.js

# اجرای همزمان n8n + اسکریپت بیدار نگهدارنده
CMD ["sh", "-c", "node /keepalive/keepalive.js & n8n start"]
