#!/bin/sh

mkdir -p ./.wireguard
# Genera llave privada y publica
wg genkey | tee ./.wireguard/priv.key | wg pubkey > ./.wireguard/pub.key

priv_key=$(cat ./.wireguard/priv.key)


if [ -z "$1" ]; then
    echo "Usage: $0 <client_CIDR>"
    exit 1
fi

echo \
"
[Interface]
Address = $1
# Client PRIV Key
PrivateKey = $priv_key
" > ./.wireguard/server.conf
