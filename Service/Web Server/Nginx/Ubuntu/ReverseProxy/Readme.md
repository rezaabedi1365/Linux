## ReverseProxy

مزایای Reverse Proxy

امنیت → کاربران مستقیم به سرور اصلی دسترسی ندارند.

Load Balancing → توزیع بار بین چند سرور Backend.

SSL Termination → مدیریت گواهی SSL روی Nginx به جای بک‌اند.

Caching → کش کردن محتوا برای کاهش فشار روی سرور.

Compression → فشرده‌سازی پاسخ‌ها (gzip, brotli).

Failover → وقتی بک‌اند Down شود، به سرور دیگر هدایت می‌کند.

---------------------------------------------------------------------------------------------
## Reverse Proxy
```
http {
    server {
        listen 80;
        server_name myapp.local;

        location / {
            proxy_pass http://127.0.0.1:8080;   # بک‌اند (مثلاً اپلیکیشن Node.js)
            
            # هدرهای مهم
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
    }
}
```

## Reverse Proxy + SSL Terminate
```
server {
    listen 443 ssl;
    server_name myapp.local;

    ssl_certificate     /etc/ssl/certs/myapp.crt;
    ssl_certificate_key /etc/ssl/private/myapp.key;

    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}

```

## Reverse Proxy + Load Balancing
```
http {
    upstream backend {
        server 192.168.1.10:8080;
        server 192.168.1.11:8080;
    }

    server {
        listen 80;
        server_name myapp.local;

        location / {
            proxy_pass http://backend;
        }
    }
}
```



