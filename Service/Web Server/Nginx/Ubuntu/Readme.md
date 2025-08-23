
## Nginx Config files
/etc/nginx/
- sites-available  :   /etc/nginx/sites-available/your_domain

- sites-enabled  :   ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
- nginx.conf  :

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


## Nginx Default Site
- /var/www/html/
    * index.nginx-debian.html
    * Yoursite\index.html

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
