FROM node:20-slim

ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0

# Install n8n globally (use --legacy-peer-deps if you encounter dependency resolution failures)
RUN npm install -g n8n@latest --unsafe-perm=true --no-fund --no-audit

# Copy the Node entrypoint and give correct permissions
COPY entrypoint.js /entrypoint.js
RUN chmod 0755 /entrypoint.js && chown node:node /entrypoint.js

EXPOSE 5678

# Run as non-root user provided by the node image
USER node

CMD ["node", "/entrypoint.js"]
