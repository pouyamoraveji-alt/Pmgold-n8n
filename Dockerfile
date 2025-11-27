FROM node:18-slim

ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0

# Install n8n globally
RUN npm install -g n8n@latest --unsafe-perm=true --no-fund --no-audit

# Copy our node-based entrypoint which starts n8n and performs keepalive pings
COPY entrypoint.js /entrypoint.js
RUN chmod 0755 /entrypoint.js && chown node:node /entrypoint.js

EXPOSE 5678

# Run as the non-root 'node' user provided by the base image
USER node

# Start the Node entrypoint that spawns `n8n start` (no shell required)
CMD ["node", "/entrypoint.js"]
