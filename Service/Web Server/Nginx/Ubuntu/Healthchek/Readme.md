## Health check
در Load Balancer → Health Check قلب ماجراست.

در Reverse Proxy → Health Check بیشتر برای پشتیبان‌گیری و Failover کاربرد داره.
- Active health checks – which are exclusive to NGINX Plus 
- Passive health checks – available in both NGINX Open Source and NGINX Plus 

----------------------------------------------------------------------------------------------------- 
- HTTP Health Checks
   * Active Health Checks 
      + Specifying the Requested URI
      + Defining Custom Conditions
      + Mandatory Health Checks
   * Passive Health Checks 
      + Server Slow Start 
- TCP Health Checks
   * Active TCP Health Checks
      + Fine-Tuning TCP Health Checks
      + The “match {}” Configuration Block
   * Passive TCP Health Checks
      + Server Slow Start

- UDP Health Checks
   * Active UDP Health Checks
      + Fine-Tuning UDP Health Checks
      + The “match {}” Configuration Block
   * Passive UDP Health Checks


- gRPC Health Checks
   * gRPC Servers that accept health checking protocol
   * gRPC Servers that do not accept health checking protocol

------------------------------------------------------------------------------------------------------------------
## HTTP Passive Health check (HTTP Load Balancing)
- 
```
http {
    upstream backend {
        least_conn;   # الگوریتم کمترین اتصال

        server 192.168.1.10 max_fails=3 fail_timeout=30s;
        server 192.168.1.11 max_fails=3 fail_timeout=30s;
        server 192.168.1.12 backup;
    }

    server {
        listen 80;
        server_name myapp.local;

        location / {
            proxy_pass http://backend;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
        }
    }
}
```

## TCP Passive Health chek (TCP Load Balancing)
```
stream {
    upstream mysql_backend {
        least_conn;   # الگوریتم: کمترین اتصال فعال

        # دو سرور دیتابیس
        server 192.168.1.10:3306 max_fails=3 fail_timeout=30s;
        server 192.168.1.11:3306 max_fails=3 fail_timeout=30s;
        server 192.168.1.12:3306 backup;   # فقط وقتی بقیه Down باشند
    }

    server {
        listen 3306;
        proxy_pass mysql_backend;
        
        # تنظیمات اختیاری
        proxy_connect_timeout 5s;
        proxy_timeout 1m;
    }
}

```
- TCP Health check for mysql
```
stream {
    upstream mysql_backend {
        least_conn;   # الگوریتم: کمترین اتصال فعال

        # دو سرور دیتابیس
        server 192.168.1.10:3306 max_fails=3 fail_timeout=30s;
        server 192.168.1.11:3306 max_fails=3 fail_timeout=30s;
        server 192.168.1.12:3306 backup;   # فقط وقتی بقیه Down باشند
    }

    server {
        listen 3306;
        proxy_pass mysql_backend;
        
        # تنظیمات اختیاری
        proxy_connect_timeout 5s;
        proxy_timeout 1m;
    }
}
```
- TCP Health check for Redis
```
stream {
    upstream redis_backend {
        server 192.168.1.20:6379 max_fails=2 fail_timeout=20s;
        server 192.168.1.21:6379;
    }

    server {
        listen 6379;
        proxy_pass redis_backend;
    }
}

```

## UDP Passive Health Checks (UDP Load Balancing)
```
```

## gRPC Passive Health Checks (gPRC Load Balancing)
```
```
