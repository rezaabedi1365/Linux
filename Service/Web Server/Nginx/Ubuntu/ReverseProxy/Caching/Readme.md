## Reverse Proxy + Caching
```
http {
    # محل ذخیره cache
    proxy_cache_path /var/cache/nginx levels=1:2 keys_zone=my_cache:10m max_size=1g inactive=60m use_temp_path=off;

    server {
        listen 80;
        server_name example.com;

        location / {
            # فعال کردن proxy
            proxy_pass http://backend_server;

            # فعال کردن cache
            proxy_cache my_cache;

            # مدت زمان اعتبار cache
            proxy_cache_valid 200 302 10m;   # پاسخ‌های 200 و 302 به مدت 10 دقیقه کش شوند
            proxy_cache_valid 404 1m;        # پاسخ 404 به مدت 1 دقیقه کش شود

            # هدرهایی که cache را کنترل می‌کنند
            proxy_ignore_headers Cache-Control Expires;

            # تنظیم هدر برای شناسایی کش
            add_header X-Cache-Status $upstream_cache_status;
        }
    }
}

```
