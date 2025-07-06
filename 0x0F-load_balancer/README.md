# 0x0F. Load balancer

This project configures a load-balanced web infrastructure using HAProxy and Nginx. All configurations are automated using Bash scripts.

## Tasks

### 0. Double the number of webservers
- Script: `0-custom_http_response_header`
- Configures Nginx on web servers to add a custom `X-Served-By` HTTP header containing the server hostname.

### 1. Install your load balancer
- Script: `1-install_load_balancer`
- Installs and configures HAProxy on the load balancer server.
- HAProxy distributes requests to `web-01` and `web-02` using the `roundrobin` algorithm.
- HAProxy is managed via an init script.

