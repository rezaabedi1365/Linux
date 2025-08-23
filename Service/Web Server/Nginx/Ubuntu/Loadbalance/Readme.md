## Nginx Opensource Loadbalace 
- Algirithm
    * Round Robin (Default)
    * Least Connections
    * IP Hash (session persistence)
    * Hash (Custom Hash)
    * Weight
- Healch Check
    * Passive Heals check
## Nginx Plus Loadbalance
🔹 امکانات پیشرفته در Nginx Plus (نسخه تجاری)

Active Health Checks → درخواست‌های دوره‌ای به سرور (مثلاً /health) برای تست سالم بودن.

Dynamic Reconfiguration → اضافه یا حذف سرورها بدون ری‌استارت.

Session Persistence پیشرفته → بر اساس Cookie یا Header.

API و داشبورد مانیتورینگ → مشاهده لحظه‌ای وضعیت لود بالانس.

Dynamic Weight → تغییر خودکار وزن سرورها بر اساس لود.


-------------------------------------------------------------------------
- Least Connections loadbalance Algorithm
```
upstream backend {
    least_conn;
    server 192.168.1.10;
    server 192.168.1.11;
}

```
- IP Hash (session persistence) loadbalance Algorithm

```
upstream backend {
    ip_hash;
    server 192.168.1.10;
    server 192.168.1.11;
}

```
- Hash (Custom Hash) loadbalance Algorithm

```
upstream backend {
    hash $request_uri;
    server 192.168.1.10;
    server 192.168.1.11;
}

```
- Weight loadbalance Algorithm

```
upstream backend {
    server 192.168.1.10 weight=3;
    server 192.168.1.11 weight=1;
}

```



example:
```
http {
    upstream myapp {
        # الگوریتم پیش‌فرض Round Robin
        server 192.168.1.10;
        server 192.168.1.11;
        
        # یا می‌توانستیم یکی از الگوریتم‌ها رو فعال کنیم:
        # least_conn;
        # ip_hash;
    }

    server {
        listen 80;
        server_name myapp.local;

        location / {
            proxy_pass http://myapp;           # ارجاع به upstream
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }
    }
}

```

## loadbalance with Passive health check
```
http {
    upstream myapp {
        # الگوریتم: least_conn (کمترین اتصال فعال)
        least_conn;

        # تعریف سرورها
        server 192.168.1.10 max_fails=3 fail_timeout=30s;
        server 192.168.1.11 max_fails=3 fail_timeout=30s;
        server 192.168.1.12 backup;  # سرور بکاپ (فقط وقتی بقیه Down هستند)
دت زمان بلاک شدن سرور پس از خطا
    }

    server {
        listen 80;
        server_name myapp.local;

        location / {
            proxy_pass http://myapp;
            proxy_http_version 1.1;
            proxy_set_header Connection "";

            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }

        # مسیر برای تست Health دستی
        location /status {
            stub_status on;   # نیاز به فعال بودن ماژول ngx_http_stub_status_module
            allow 127.0.0.1;
            deny all;
        }
    }
}
```

