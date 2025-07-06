# 0x13. Firewall

This project focuses on configuring firewall rules using UFW (Uncomplicated Firewall) to secure web servers in a load-balanced environment.

## Tasks

### 0. Block all incoming traffic but
- Script: `0-block_all_incoming_traffic_but`
- Installs UFW
- Configures UFW to block all incoming traffic except for:
  - TCP port 22 (SSH)
  - TCP port 80 (HTTP)
  - TCP port 443 (HTTPS)

### 1. Port forwarding
- Script: `100-port_forwarding`
- Installs UFW
- Configures UFW to forward incoming traffic on TCP port 8080 to TCP port 80
- Ensures Nginx (or any server on port 80) can respond to requests received on port 8080
