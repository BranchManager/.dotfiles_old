OUT=$(tailscale status | grep "archbranchmain" | awk '{print $NF}')

if [[ $OUT == "-" ]]; then
    tailscale down
elif [[ -z "$OUT" ]]; then
    tailscale up
    
fi

tailscale status