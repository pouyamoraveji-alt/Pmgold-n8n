const https = require("https");

function ping() {
  const url = process.env.RENDER_EXTERNAL_URL;
  if (!url) {
    console.log("No RENDER_EXTERNAL_URL found.");
    return;
  }
  https.get(url, (res) => {
    console.log(`Pinged: ${url} Status: ${res.statusCode}`);
  }).on("error", (err) => {
    console.log("Error pinging:", err.message);
  });
}
console.log("KeepAlive started...");
ping();
setInterval(ping, 10 * 60 * 1000);
