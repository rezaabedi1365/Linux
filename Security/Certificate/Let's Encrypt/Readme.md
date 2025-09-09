
# Let's Encrypt
### ACME Protocol
    * HTTP-01 Challenge
        + Requre publish port 80
        + automate with python3-certbot-nginx or python3-certbot-apache
        + http://yourdomain.com/.well-known/acme-challenge/...
    * DNS-01 Challenge
        * Require access to DNS and create txt record
        * automat with API DNS
        + TXT Record _acme-challenge.yourdomain.com in DNS 
    * TLS-ALPN-01 Challenge

