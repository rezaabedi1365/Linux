

---

### 1. **SSL Termination (پایان‌دهی SSL)**

* SSL فقط در نقطه‌ی جلویی (مثلا Load Balancer) باز می‌شود.
* ترافیک از آنجا به سرور **HTTP ساده** منتقل می‌شود.
* وب سرور نیاز به گواهینامه ندارد یا از HTTPS استفاده نمی‌کند.

### 2. **SSL Passthrough**

* SSL اصلا در Load Balancer یا Reverse Proxy باز نمی‌شود.
* ترافیک رمزگذاری شده مستقیم به وب سرور منتقل می‌شود.
* وب سرور خودش SSL را terminate می‌کند.
* Load Balancer هیچ دسترسی به محتوای رمزگذاری شده ندارد.

### 3. **SSL Bridging / SSL Re-encryption**

* SSL در Load Balancer terminate می‌شود، سپس ترافیک دوباره با HTTPS به سرور اصلی ارسال می‌شود.
* یعنی **دو لایه رمزگذاری:** یکی بین کاربر و Load Balancer، یکی بین Load Balancer و وب سرور.
* وب سرور هم SSL فعال دارد و محتوای رمزگذاری شده دریافت می‌کند.

---

💡 پس وقتی هم در Load Balancer و هم در وب سرور گواهینامه دارید، بیشتر به **SSL Bridging / Re-encryption** گفته می‌شود تا صرفا Termination.

---------------------------










## Fullchain Certificate (Bundle) Structur
```
-----BEGIN CERTIFICATE-----
(Your server certificate)
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
(Intermediate certificate)
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
(Root certificate, اختیاری)
-----END CERTIFICATE-----
```
https://linuxconfig.org/step-by-step-guide-adding-certificates-to-ubuntus-trusted-authorities

```
$ sudo apt install ca-certificates
$ sudo cp mycert.crt /usr/local/share/ca-certificates
$ sudo update-ca-certificates
```
```
Root Ca Path
/etc/ssl/certs/
```
---------------------------------------------------------------------------------------------------------------------------

https://www.ibm.com/docs/en/license-metric-tool?topic=certificate-step-1-creating-private-keys-certificates
```
Ceating private keys 
openssl genrsa -des3 -out private_key.key 2048
Enables password for the private key.
openssl rsa -des3 -in path_to_private_key.key -out key_name.key
```
```
Creating CSR
openssl req -new -key private_key.key -out CSR.csr
```
```
Signing certificates
openssl x509 -signkey CA_private_key.key -days 90 -req -in CA_CSR.csr -out CA_certificate.arm -sha256
openssl x509 -req -days 90 -in CSR.csr -CA CA_certificate.arm -CAkey CA_private_key.key -out certificate.arm -set_serial 01 -sha256
```

