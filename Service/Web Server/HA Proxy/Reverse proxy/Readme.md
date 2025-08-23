
## Reverse Proxy
```
global
    log /dev/log local0
    daemon
    maxconn 2000

defaults
    log     global
    mode    http
    timeout connect 5000ms
    timeout client  50000ms
    timeout server  50000ms

frontend http_front
    bind *:80
    default_backend web_back

backend web_back
    balance roundrobin
    server web1 192.168.1.10:80 check
    server web2 192.168.1.11:80 check

```

## SSL
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

# --- HTTPS frontend ---
frontend https_front
    bind *:443 ssl crt /etc/ssl/certs/haproxy.pem
    mode http
    default_backend web_back

# --- Backend سرورهای داخلی ---
backend web_back
    mode http
    balance roundrobin
    option http-server-close
    option forwardfor
    option redispatch
    server web1 192.168.1.10:443 ssl verify none check inter 5000 rise 2 fall 3
    server web2 192.168.1.11:443 ssl verify none check inter 5000 rise 2 fall 3
```
