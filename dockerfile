FROM n8nio/n8n:latest

# نصب bash و curl
USER root
RUN apt-get update && apt-get install -y bash curl && apt-get clean

# پوشه برای اسکریپت KeepAlive
RUN mkdir -p /keepalive
COPY keepalive.js /keepalive/keepalive.js

# اجرای همزمان KeepAlive + n8n
CMD ["bash", "-c", "node /keepalive/keepalive.js & n8n start"]
