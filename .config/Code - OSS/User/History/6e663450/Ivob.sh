
OUT=$(tailscale status | grep "archbranchmain" | awk '{print $NF}')

#echo "{\"online\": \"$OUT\"}" 
echo "{\"text\": \"text\", \"alt\": \"$OUT\", \"tooltip\": \"false\", \"class\": \"code\" }"