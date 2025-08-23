Here is a concise guide to installing and configuring HAProxy on Ubuntu Linux for load balancing and proxying HTTP traffic:

## Installation

1. **Install HAProxy**

   ```bash
   sudo apt install haproxy
   ```
   This installs the latest stable version from the Ubuntu repository[6][5].
2. **Start HAProxy**

   ```bash
   sudo systemctl enable haproxy
   sudo systemctl start haproxy
   
   ```
3. **Verification

  ```bash
  sudo systemctl status haproxy
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


## SSL
```
cat yourdomain.crt yourdomain.key > /etc/ssl/certs/haproxy.pem
chmod 600 /etc/ssl/certs/haproxy.pem
```
```
global
    log /dev/log local0
    log /dev/log local1 notice
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

frontend https_front
    bind *:443 ssl crt /etc/ssl/certs/haproxy.pem
    mode http
    default_backend https_back

backend https_back
    balance roundrobin
    mode http
    option http-server-close
    option forwardfor
    server web1 192.168.1.10:443 ssl verify none
    server web2 192.168.1.11:443 ssl verify none

```

## ssl and HTTP Redirect to HTTPS
```
global
    log /dev/log local0
    log /dev/log local1 notice
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

# --- HTTP frontend (برای ریدایرکت به HTTPS) ---
frontend http_front
    bind *:80
    mode http
    redirect scheme https code 301 if !{ ssl_fc }

# --- HTTPS frontend ---
frontend https_front
    bind *:443 ssl crt /etc/ssl/certs/haproxy.pem
    mode http
    default_backend https_back

# --- Backend با Load Balancing ---
backend https_back
    balance roundrobin
    mode http
    option http-server-close
    option forwardfor
    server web1 192.168.1.10:443 ssl verify none
    server web2 192.168.1.11:443 ssl verify none

```






