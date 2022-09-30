OUT=$(tailscale status | grep "archbranchmain" | awk '{print $NF}')

if [ $OUT = "-" ]; then
    tailscale down
elif [ $OUT = "offline" ]; then
    tailscale up --ssh
fi

tailscale status