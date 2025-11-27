// node entrypoint that runs keepalive pings and spawns `n8n start`
// This avoids relying on /bin/sh or any shell being present in the image.
const { spawn } = require('child_process');
const https = require('https');

const intervalMs = 10 * 60 * 1000; // 10 minutes

// Keepalive: if RENDER_EXTERNAL_URL exists, ping it every 10 minutes.
const renderUrl = process.env.RENDER_EXTERNAL_URL ? `https://${process.env.RENDER_EXTERNAL_URL}` : null;
if (renderUrl) {
  console.log(`Keepalive is enabled. Pinging ${renderUrl} every ${intervalMs/1000}s`);
  // initial ping immediately
  const ping = () => {
    try {
      const req = https.get(renderUrl, (res) => {
        // drain response
        res.on('data', () => {});
        res.on('end', () => {});
      });
      req.on('error', (err) => {
        // ignore errors
        console.error('Keepalive ping error:', err.message);
      });
      req.setTimeout(5000, () => {
        req.abort();
      });
    } catch (err) {
      console.error('Keepalive ping exception:', err && err.message);
    }
  };
  ping();
  setInterval(ping, intervalMs);
} else {
  console.log('RENDER_EXTERNAL_URL not set; keepalive disabled.');
}

// Spawn n8n start as a child process (no shell). stdout/stderr inherited.
console.log('Spawning n8n start...');
const child = spawn('n8n', ['start'], { stdio: 'inherit' });

child.on('exit', (code, signal) => {
  if (signal) {
    console.log(`n8n process exited with signal ${signal}`);
    process.exit(1);
  }
  console.log(`n8n process exited with code ${code}`);
  process.exit(code);
});

child.on('error', (err) => {
  console.error('Failed to spawn n8n:', err && err.message);
  process.exit(1);
});
