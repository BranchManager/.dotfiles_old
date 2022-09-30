
OUT=$(tailscale status | grep "archbranchmain" | awk '{print $NF}')

echo "{\"online\":$OUT}"