
## Nginx Config files
/etc/nginx/
- sites-available  :   /etc/nginx/sites-available/your_domain

- sites-enabled  :   ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
- nginx.conf  :  (Default setting and include site available and site enable) no change

recomende:
- :x: /etc/nginx/nginx.conf (Default setting and include site available and site enable) no change
- mehod 1: create for each site one config file in sites-available and create link to site-enable
- nethod 2: create one config file for all site in site-availabel and create link to site-enable (Recomend)


## Nginx Default Site
- /var/www/html/
    * index.nginx-debian.html
    * Yoursite\index.html
      


---------------------------------------------------------------------------------------------
# Nginx Directive
- Main / Global
- HTTP Block Directives
- Server Block Directives
- Location Block Directives
- Security Directives
- proxy and fastg Directive for applications

Default :
/etc/nginx/nginx.conf
```
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
        worker_connections 768;
        }

http {
        sendfile on;
        tcp_nopush on;
        types_hash_max_size 2048;
        include /etc/nginx/mime.types;
        default_type application/octet-stream;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
        ssl_prefer_server_ciphers on;
        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;
        gzip on;
        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
}
```
- example :
- /etc/nginx/sites-available/your_domain
        *  // ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

```
# فایل اصلی: /etc/nginx/nginx.conf

user www-data;
worker_processes auto;
pid /run/nginx.pid;

events {
    worker_connections 1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;

    sendfile        on;
    keepalive_timeout 65;
    server_tokens   off;

    # تعریف فرمت لاگ دلخواه
    log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';

    # لاگ پیش‌فرض سطح http
    access_log /var/log/nginx/access.log main;
    error_log /var/log/nginx/error.log warn;

    # ===== سرور اول: web1 =====
    server {
        listen 80 default_server;
        server_name web1.faradis.net;
        root /var/www/html/web1;
        index index.php index.html index.htm;

        # لاگ جداگانه برای web1
        access_log /var/log/nginx/web1_access.log main;
        error_log /var/log/nginx/web1_error.log warn;

        location / {
            try_files $uri $uri/ =404;
        }

        # پشتیبانی PHP
        location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        }

        # محدودیت IP برای /admin
        location /admin {
            allow 192.168.1.0/24;
            deny all;
        }
    }

    # ===== سرور دوم: web2 =====
    server {
        listen 80;
        server_name web2.faradis.net;
        root /var/www/html/web2;
        index index.php index.html index.htm;

        # لاگ جداگانه برای web2
        access_log /var/log/nginx/web2_access.log main;
        error_log /var/log/nginx/web2_error.log warn;

        location / {
            try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        }
    }
}

```

------------------------------------------------------
/etc/nginx/sites-available/your_domain
- // ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
## Alternative Port
```
server {
        listen 8091 default_server;
        root /var/www/html/web1;
        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;
        server_name web1.faradis.net;
        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }
}

server {
        listen 8092 ;
        server_name web2.faradis.net;
        root /var/www/html/web2;
        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;
        location / {

        }
}

```

## Virtual Host (same port)
/etc/nginx/sites-available/your_domain
- // ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
```
server {
        # Default server configuration        **********open web both ip and name 
        listen 8090 default_server;    
        root /var/www/html/web1;
        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;
        server_name web1.faradis.net;
        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }
}

server {
        listen 8090 ;
        #                                   **********open web only with name      
        server_name web2.faradis.net;
        root /var/www/html/web2;
        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;
        location / {

        }
}
```

## location Directive
```
server {
        listen 8091 default_server;
        root /var/www/html/web1;
        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;
        server_name web1.faradis.net;
        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }
        location /image {
                root /var/www/html/web1/image/;
                index index.html index.htm index.nginx-debian.html;
                
}

```

## location Directive (ACL)
```
server {
        listen 8091 default_server;
        root /var/www/html/web1;
        
        location / {
                allow 192.168.1.20;
                deny all;
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }
}
```

## location Directive (Response Code)
```
server {
        listen 8091 default_server;
        root /var/www/html/web1;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }
}
```

## SSL Directive
```


server {
        listen 443 default_server;
        server_name web1.faradis.net;
        ssl on;
        ssl_certificate /tmp/faradis.net/cert.pem;
        ssl_certificate_key     /tmp/faradis.net/server.key;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
        ssl_prefer_server_ciphers on;

        root /var/www/html/web1;
        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;
        server_name web1.faradis.net;
        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }
}
```

## log Directive
```
server {
    listen 80;
    server_name example.com;
    root /var/www/html;

    access_log /var/log/nginx/example_access.log main;
    error_log /var/log/nginx/example_error.log warn;

    location / {
        try_files $uri $uri/ =404;
    }
}

```
