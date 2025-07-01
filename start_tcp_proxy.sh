#!/bin/bash

# Script to start cloudflared TCP proxy for VNC connection
# This creates a local TCP proxy that forwards to the Cloudflare tunnel

echo "Starting Cloudflare TCP proxy for VNC..."

# Kill any existing cloudflared proxy on port 5901
pkill -f "cloudflared access tcp.*5901" 2>/dev/null

# Get the tunnel URL from environment or command line
TUNNEL_URL="${1:-verified-implement-requesting-latinas.trycloudflare.com}"

echo "Connecting to tunnel: $TUNNEL_URL"

# Start the TCP proxy
# This will forward localhost:5901 to the remote VNC server through Cloudflare
cloudflared access tcp --hostname "$TUNNEL_URL" --url localhost:5901 &

echo "TCP proxy started. VNC should now be accessible at localhost:5901"
echo "Process ID: $!"