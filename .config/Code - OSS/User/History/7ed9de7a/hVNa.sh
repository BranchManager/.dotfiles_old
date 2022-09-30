OUT=$(tailscale status | grep "archbranchmain" | awk '{print $NF}')

if [[ $OUT == "-" ]]; then
    tailscale down
elif [[ $OUT == "" ]]; then
    tailscale up
    tailscale up --ssh
fi

tailscale status