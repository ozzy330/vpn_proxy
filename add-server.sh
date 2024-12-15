#!/bin/sh

# Genera llave privada y publica
wg genkey | tee ./.wireguard/priv.key | wg pubkey > ./.wireguard/pub.key

priv_key=$(cat ./.wireguard/priv.key)
address=10.0.0.1/24

echo \
"
[Interface]
Address = $address
ListenPort = 51820
# Server PRIV Key
PrivateKey = $priv_key
" > ./.wireguard/server.conf
