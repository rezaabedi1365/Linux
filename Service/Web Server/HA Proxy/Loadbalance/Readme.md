
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

## SSL , HTTP/2، WebSocket , HTTP→HTTPS، Load Balancing، Health Check و Failover

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

# --- HTTPS frontend با HTTP/2 و WebSocket ---
frontend https_front
    bind *:443 ssl crt /etc/ssl/certs/haproxy.pem alpn h2,http/1.1
    mode http
    option http-server-close
    option forwardfor
    default_backend https_back

    # WebSocket upgrade
    acl is_websocket hdr(Upgrade) -i WebSocket
    use_backend ws_back if is_websocket

# --- Backend برای وب‌اپلیکیشن معمولی ---
backend https_back
    mode http
    balance roundrobin
    option http-server-close
    option forwardfor
    option redispatch
    server web1 192.168.1.10:443 ssl check verify none inter 5000 rise 2 fall 3
    server web2 192.168.1.11:443 ssl check verify none inter 5000 rise 2 fall 3
    server web3 192.168.1.12:443 ssl check verify none inter 5000 rise 2 fall 3

# --- Backend برای WebSocket ---
backend ws_back
    mode http
    balance roundrobin
    option http-server-close
    option forwardfor
    option redispatch
    timeout client  1h
    timeout server  1h
    server ws1 192.168.1.10:443 ssl check verify none inter 5000 rise 2 fall 3
    server ws2 192.168.1.11:443 ssl check verify none inter 5000 rise 2 fall 3
```
