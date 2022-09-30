OUT=$(tailscale status | grep "archbranchmain" | awk '{print $NF}')

if [ $OUT -eq "-" ]; then
    tailscale down
elif $OUT == "offline"; then
    tailscale up --ssh
fi