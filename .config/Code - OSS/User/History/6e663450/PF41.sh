
OUT=$(tailscale status | grep "archbranc" | awk '{print $NF}')

echo $OUT