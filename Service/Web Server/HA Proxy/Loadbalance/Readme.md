
## Basic Config
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
## SSL , HTTP→HTTPS , Load Balancing , Health Check
```
global
    log /dev/log local0
    log /dev/log local1 notice
    daemon
    maxconn 5000
    tune.ssl.default-dh-param 2048
    ssl-default-bind-ciphers ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384
    ssl-default-bind-options no-sslv3 no-tls-tickets

defaults
    log     global
    mode    http
    option  httplog
    option  dontlognull
    timeout connect 5000ms
    timeout client  50000ms
    timeout server  50000ms
    option  forwardfor

# --- HTTP frontend (ریدایرکت به HTTPS) ---
frontend http_front
    bind *:80
    mode http
    redirect scheme https code 301 if !{ ssl_fc }

# --- HTTPS frontend ---
frontend https_front
    bind *:443 ssl crt /etc/ssl/certs/haproxy.pem
    mode http
    default_backend https_back

# --- Backend با Load Balancing و Health Check ---
backend https_back
    mode http
    balance roundrobin
    option http-server-close
    option forwardfor
    option redispatch  # اگر سرور خراب بود، دوباره درخواست به سرور دیگر فرستاده شود

    # Health Check سرورها
    server web1 192.168.1.10:443 ssl check verify none inter 5000 rise 2 fall 3
    server web2 192.168.1.11:443 ssl check verify none inter 5000 rise 2 fall 3
    server web3 192.168.1.12:443 ssl check verify none inter 5000 rise 2 fall 3

```
