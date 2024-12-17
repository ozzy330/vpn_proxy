# vpn_proxy

Permite crear una VPN y un reverse proxy para servir recursos desde una maquina abierta al público a otra(s) privadas.

## Requisitos

- [WireGuard](https://www.wireguard.com/)
- [Docker](https://www.docker.com/)
- [Caddy](https://caddyserver.com/)

## Uso

Correr el script `add-server.sh` en una máquina con un IP publica (endpoint).
Correr el script `add-client.sh` en una máquina que quiere acceder a la VPN.
Correr el script `add-peer.sh` en el servidor para configurar el cliente. Y copiar la configuración que se devuelve en dicho cliente.
Modificar el archivo `Caddyfile` para que apunte al servicio.
