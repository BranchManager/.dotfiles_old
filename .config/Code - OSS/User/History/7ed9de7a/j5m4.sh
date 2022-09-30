OUT=$(tailscale status | grep "archbranchmain" | awk '{print $NF}')

if $OUT == "-" then
    tailscale down
elif $OUT == "offline"
    tailscale up --ssh
done