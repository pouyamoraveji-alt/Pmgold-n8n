FROM n8nio/n8n:latest

# پورت n8n
ENV N8N_PORT=5678
EXPOSE 5678

# اجرای n8n
CMD ["n8n"]
