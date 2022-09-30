
OUT=$(tailscale status | grep "archbranchmain" | awk '{print $NF}')

echo $OUT