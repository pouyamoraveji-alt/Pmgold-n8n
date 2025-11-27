services:
  - type: web
    name: pmgold-n8n
    env: docker
    plan: free
    autoDeploy: true
    dockerfilePath: ./Dockerfile
    healthCheckPath: /
    envVars:
      - key: N8N_BASIC_AUTH_ACTIVE
        value: "true"
      - key: N8N_BASIC_AUTH_USER
        value: admin
      - key: N8N_BASIC_AUTH_PASSWORD
        value: admin123
      - key: N8N_HOST
        value: 0.0.0.0
      - key: N8N_PORT
        value: 5678
