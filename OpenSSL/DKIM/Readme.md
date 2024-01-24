
# DKIM ”Domain Keys Identified Mail”
## How to create a DKIM record with OpenSSL
https://www.mailhardener.com/kb/how-to-create-a-dkim-record-with-openssl

 ####  Generating the private key
```
openssl genrsa -out dkim_private.pem 2048
```
####  Choosing a selector

```
sudo 
```
#### Creating the DNS record
```
openssl rsa -in dkim_private.pem -pubout -outform der 2>/dev/null | openssl base64 -A
```
Note for Windows users
```
openssl rsa -in dkim_private.pem -pubout -outform der 2> nul | openssl base64 -A
```
 In its minimal form, a DKIM DNS record will look like this:
```
p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArPdDS3zq7wsDtXR/dP9QVaay1m0QpksDulGfqZ1H4Cnd4mT+eRZbnSfpd0BY6iuxAosJGtEkbeZkZslMkGb1ocKkN/EofzGEIC4QV/y1qyujUQ6htFcRk64v
 ```
#### Placing the record in your DNS zone
```
"v=DKIM1; k=rsa; h=sha256;
p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArPdDS3zq7wsDtXR/dP9QVaay1m0QpksDulGfqZ1H4Cnd4mT+eRZbnSfpd0BY6iuxAosJGtEkbeZkZslMkGb1ocKkN/EofzGEIC4QV/y1qyujUQ6htFcRk64v
```
#### DNS length limitations
https://www.mailhardener.com/tools/dns-record-splitter
 *  DNS record splitter 
------------------------------------------------------------------------
# SPF ”Sender Policy Framework”
```
v=spf1 mx ip4:5.100.84.78 ~all
```



------------------------------------------------------------------------
## DMARC “Domain-based Message Authentication, Reporting & Conformance
```
v=DMARC1; p=reject; rua=mailto:fdmarc@fartest.net; ruf=mailto:fdmarc@faratest.net; fo=1
```
![image](https://github.com/rezaabedi1365/LinuxConfigFile/assets/117336743/7cd83fac-a65d-4ea5-bc65-af65d3c48a74)

------------------------------------------------------------------------
# ُgoogle-site-verification
```
google-site-verification=P6deWWdFHInTYZx6jeUfY_HRRvJgj666kbEWNbNV9b0
```
