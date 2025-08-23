## WAF
#### SQL Injection، XSS، Remote File Inclusion
- ModSecurity 
- Nginx App Protect (Nginx Plus)
---------------------------------------------------------

## ModSecurity 

```
load_module modules/ngx_http_modsecurity_module.so;

server {
    listen 80;
    server_name example.com;

    modsecurity on;
    modsecurity_rules_file /etc/nginx/modsec/main.conf;

    location / {
        proxy_pass http://backend_server;
    }
}

```
