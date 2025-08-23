## 

```
http {
    upstream backend {
        # الگوریتم Least Connections برای تقسیم بار
        least_conn;

        # سه بک‌اند با تنظیمات health check ساده
        server 192.168.1.10 max_fails=3 fail_timeout=30s;
        server 192.168.1.11 max_fails=3 fail_timeout=30s;
        server 192.168.1.12 backup;   # فقط وقتی بقیه Down باشند

        # توضیح:
        # max_fails = چند بار خطا باعث غیر فعال شدن سرور می‌شود
        # fail_timeout = مدت زمان بلاک بودن سرور
    }

    server {
        listen 80;
        server_name myapp.local;

        # اینجا Nginx نقش Reverse Proxy رو داره
        location / {
            proxy_pass http://backend;    # به upstream هدایت کن
            proxy_http_version 1.1;
            proxy_set_header Connection "";

            # هدرهای ضروری برای فوروارد کردن اطلاعات کاربر
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }

        # مسیر مانیتورینگ وضعیت (اختیاری)
        location /nginx_status {
            stub_status on;    # فعال‌سازی وضعیت ساده Nginx
            allow 127.0.0.1;   # فقط لوکال هاست ببیند
            deny all;
        }
    }
}

```
