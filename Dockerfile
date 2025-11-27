FROM n8nio/n8n:latest

ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0

# Copy our small node-based entrypoint which starts n8n and performs keepalive pings
COPY entrypoint.js /entrypoint.js
# Ensure node file is readable (no shell needed)
# Expose port
EXPOSE 5678

# Run entrypoint with node (no shell required)
CMD ["node", "/entrypoint.js"]
