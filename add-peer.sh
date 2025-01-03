#!/bin/sh

server_pub_key=$(cat ./.wireguard/pub.key)
# IP publica del
endpoint=""

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <public_key> <client_CIDR>"
    exit 1
fi

if [ -z "$endpoint" ]; then
    echo "Enter the public IP of the server:"
    read -r endpoint
fi

echo \
"
[Peer]
# Client PUB Key
PublicKey = $1
# IPs where can serve traffic
AllowedIPs = $2
" >> ./.wireguard/server.conf

echo "Add the next to the client config:"

echo \
"
[Peer]
PublicKey = $server_pub_key
Endpoint = $endpoint:51820
# IPs that can connect to this peer (server IP for example)
AllowedIPs = <allowed_CIDRs>
PersistentKeepalive = 25
"
