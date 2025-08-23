Here is a concise guide to installing and configuring HAProxy on Ubuntu Linux for load balancing and proxying HTTP traffic:

## Installation

1. **Install HAProxy**

   ```bash
   sudo apt install haproxy
   ```
   This installs the latest stable version from the Ubuntu repository[6][5].
2. **Start HAProxy**

   ```bash
   sudo systemctl start haproxy
   ```

3. **Enable HAProxy to Start at Boot**

   ```bash
   sudo systemctl enable haproxy
   ```

## Basic Configuration

- Edit the HAProxy Configuration File**

   ```bash
   sudo nano /etc/haproxy/haproxy.cfg
   ```

```
global
    log /dev/log    local0
    log /dev/log    local1 notice
    daemon
    maxconn 2000

defaults
    log     global
    mode    http
    option  httplog
    option  dontlognull
    timeout connect 5000ms
    timeout client  50000ms
    timeout server  50000ms

frontend http_front
    bind *:80
    default_backend http_back

backend http_back
    balance roundrobin
    server web1 192.168.1.10:80 check
    server web2 192.168.1.11:80 check

```

- This is the main configuration file for HAProxy[6][5].

   * frontend**: Listens on port 80 and forwards requests to the backend.
   * backend**: Defines the servers to balance traffic between, using the `roundrobin` algorithm[6][8].
   * server**: Replace IPs and ports with your actual backend servers.


## Start and Enable HAProxy

1. **Start HAProxy**

   ```bash
   sudo systemctl start haproxy
   ```

2. **Enable HAProxy to Start at Boot**

   ```bash
   sudo systemctl enable haproxy
   ```
   This ensures HAProxy will start automatically after a reboot[6][5].

## Verification

- **Check HAProxy Status**

  ```bash
  sudo systemctl status haproxy
  ```
- **Access Your Load Balancer**

  Open a browser and navigate to your HAProxy server’s IP address. Requests will be distributed to your backend servers[6].

## Additional Options

- **Authentication**: You can set up basic authentication by adding user/password directives in the configuration[7].
- **SSL/TLS**: For HTTPS, add `bind *:443` and SSL certificate configuration in the frontend section.

---

HAProxy is a powerful and flexible open-source solution for load balancing and proxying HTTP, TCP, and other protocols on Ubuntu Linux[6][5][8].

