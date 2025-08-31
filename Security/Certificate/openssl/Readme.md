دنیای SSL/TLS و گواهی‌ها پر از فرمت‌های مختلفه که بعضی‌ها شبیه هم هستن و همین آدمو گیج می‌کنه. 

---

## 📌 فرمت‌های مهم گواهی و کلید

### 1. **PEM (Privacy-Enhanced Mail)**

* پسوند: `.pem`, `.crt`, `.cer`, `.key`
* متن ساده (Base64) با سرآیند/پایان:

  ```
  -----BEGIN CERTIFICATE-----
  MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A...
  -----END CERTIFICATE-----
  ```
* می‌تونه شامل **certificate**، **private key** یا **chain** باشه.
* رایج‌ترین فرمت روی لینوکس (nginx, apache, HAProxy).

---

### 2. **DER (Distinguished Encoding Rules)**

* پسوند: `.der`, `.cer`
* باینری (نه متن ساده).
* معمولاً روی ویندوز و جاوا (JVM / Tomcat) استفاده میشه.
* فقط **یک certificate** در خودش داره (نه key).

---

### 3. **PKCS#7 / P7B**

* پسوند: `.p7b`, `.p7c`
* می‌تونه Base64 یا باینری باشه.
* شامل **certificate chain** (server + intermediate + root).
* ❌ پرایوت‌کی نداره.
* بیشتر در ویندوز (IIS) و جاوا استفاده میشه.

---

### 4. **PKCS#12 / PFX**

* پسوند: `.pfx`, `.p12`
* باینری.
* شامل **certificate + chain + private key** (همه‌چی تو یک فایل).
* معمولاً وقتی می‌خوای یک گواهی رو export/import کنی استفاده میشه.
* ویندوز بیشتر با این کار می‌کنه، ولی توی لینوکس باید به PEM تبدیل بشه.

---

### 5. **JKS (Java KeyStore)**

* پسوند: `.jks`
* فرمت اختصاصی جاوا (باینری).
* نگه‌داری certificate + key برای برنامه‌های جاوایی (Tomcat, Spring Boot, Kafka).

---

### 6. **PKCS#8**

* پسوند: `.key`
* فقط برای **private key** (بصورت استانداردسازی‌شده).
* متن ساده (PEM) یا باینری (DER).

---

### 7. **SPC (Software Publisher Certificate)**

* پسوند: `.spc`
* در ویندوز برای **کدساینینگ** (امضای نرم‌افزار).
* معمولاً همراه با `.pvk` (Private Key) استفاده میشه.

---

### 🔑 تفاوت کلیدی

| فرمت        | محتوای ممکن        | پسوند رایج             | کاربرد                                    |
| ----------- | ------------------ | ---------------------- | ----------------------------------------- |
| **PEM**     | Cert, Chain, Key   | .pem, .crt, .cer, .key | Apache/Nginx/Linux                        |
| **DER**     | Cert               | .der, .cer             | جاوا / ویندوز                             |
| **P7B**     | Cert + Chain       | .p7b, .p7c             | IIS / جاوا                                |
| **PFX/P12** | Cert + Chain + Key | .pfx, .p12             | Export/Import (ویندوز، لینوکس با OpenSSL) |
| **JKS**     | Cert + Key         | .jks                   | جاوا (KeyStore)                           |
| **PKCS#8**  | Private Key        | .key                   | کلید خصوصی استاندارد                      |
| **SPC**     | Cert               | .spc                   | ویندوز / Code Signing                     |

---

👉 حالا، می‌خوای برات یه **نمودار درختی تصویری** بکشم (مثل cheat sheet) که سریع بفهمی هر فرمت چی داره و کجا استفاده میشه؟




# Verify Certificate
- match cert and private key
- Both commands should output the same value. If they don't, you'll need to ensure you're using the correct private key for this certificate.
```
openssl rsa -noout -modulus -in private.key | openssl md5
openssl x509 -noout -modulus -in Star_faradis.net.crt | openssl md5
```

- Check pfx chain
```
openssl pkcs12 -in YourDomain.pfx -nodes -info
```

- Check Csr
```
openssl req -text -in [file_name].csr -noout -verify
```


-------------------------------------------------------------------------------------------------------------------
# Convert Other Format
### Convert DER to PEM
- https://tiloid.com/p/creating-a-pfx-file-from-certificate-and-private-key
```
openssl x509 -inform der -in certificate.der -out certificate.pem
```
```
openssl rsa -inform der -in privatekey.der -out privatekey.pem
```
### convert PKCS#7 to PEM:
```
openssl pkcs7 -print_certs -in your_pkcs7_certificate.p7b -out your_pem_certificates.pem
```
### convert PEM to PKCS#7:
```
openssl crl2pkcs7 -nocrl -certfile your_pem_certificate.crt -out your_pkcs7_certificate.p7b -certfile CA-bundle.crt
```
### convert PKCS#7 to PFX:
Method1
- To convert a certificate from PKCS#7 to PFX, the certificate should be first converted into PEM:
```
openssl pkcs7 -print_certs -in your_pkcs7_certificate.p7b -out your_pem_certificates.pem
```
- After that, the certificate can be converted into PFX.
```
openssl pkcs12 -export -out your_pfx_certificate.pfx -inkey your_private.key -in your_pem_certificate.crt
```
Method2
- STEP 1: Convert P7B to CER
```
openssl pkcs7 -print_certs -in certificatename.p7b -out certificatename.cer
```
- STEP 2: Convert CER and Private Key to PFX
```
openssl pkcs12 -export -in certificatename.cer -inkey privateKey.key -out certificatename.pfx -certfile  cacert.cer
```
### Convert x509 to PEM
openssl x509 -in certificatename.cer -outform PEM -out certificatename.pem

### Convert PEM to DER
openssl x509 -outform der -in certificatename.pem -out certificatename.der


### How to generate a self-signed SSL certificate using OpenSSL

method 1
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout selfsigned.key -out selfsigned.crt
```
method 2
```
# interactive
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 365

# non-interactive and 10 years expiration
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 3650 -nodes -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"
```
method 3

```
openssl req -new > cert.csr
openssl rsa -in privkey.pem -out key.pem
openssl x509 -in cert.csr -out cert.pem -req -signkey key.pem -days 1001
cat key.pem>>cert.pem
```
