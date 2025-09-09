
### How to Generate CSR With OpenSSL

Create RSA Private Key and CSR
```
openssl req -new -newkey rsa:2048 -nodes -keyout [your_domain].key -out your_domain.csr
```
CSR verify
```
openssl req -text -in [file_name].csr -noout -verify
```
<img width="757" height="344" alt="image" src="https://github.com/user-attachments/assets/630bd27f-8166-45fc-99d9-61f441c4ee2f" />




---

### 🔑 الگوریتم‌های پرکاربرد به‌جای RSA

1. **ECDSA (Elliptic Curve Digital Signature Algorithm)**

   * سبک‌تر و سریع‌تر از RSA، امنیت بالاتر با طول کلید کوتاه‌تر.
   * به‌جای `rsa:2048` باید یک Curve مشخص کنی:

     ```bash
     openssl ecparam -name prime256v1 -genkey -noout -out your_domain.key
     openssl req -new -key your_domain.key -out your_domain.csr
     ```
   * منحنی‌های متداول:

     * `prime256v1` (secp256r1)
     * `secp384r1`
     * `secp521r1`

2. **DSA (Digital Signature Algorithm)**

   * قدیمی‌تره، کمتر استفاده میشه، بعضی CAها دیگه ساپورت نمی‌کنن.
   * نمونه:

     ```bash
     openssl dsaparam -out dsa_param.pem 2048
     openssl gendsa -out your_domain.key dsa_param.pem
     openssl req -new -key your_domain.key -out your_domain.csr
     ```

3. **EdDSA (Ed25519 / Ed448)**

   * مدرن، سریع، بسیار امن، ولی هنوز همه‌ی CAها برای SSL پشتیبانی کامل ندارن.
   * نمونه (Ed25519):

     ```bash
     openssl genpkey -algorithm Ed25519 -out your_domain.key
     openssl req -new -key your_domain.key -out your_domain.csr
     ```

---

### 📊 مقایسه کلی

| الگوریتم    | امنیت                | سرعت      | سازگاری                        |
| ----------- | -------------------- | --------- | ------------------------------ |
| **RSA**     | خوب (با 2048+ بیت)   | متوسط     | همه‌جا ساپورت میشه             |
| **ECDSA**   | عالی (با کلید کوچیک) | خیلی سریع | اکثر مرورگرها/CAهای مدرن       |
| **DSA**     | متوسط                | کندتر     | محدود، در حال منسوخ شدن        |
| **Ed25519** | عالی                 | خیلی سریع | هنوز همه CAها پشتیبانی نمی‌کنن |

---

✅ برای وب‌سرورهای مدرن، اگه همه‌ی کلاینت‌ها/CA ساپورت کنن، **ECDSA (مثلاً prime256v1 یا secp384r1)** بهترین گزینه‌ست.
ولی اگه دنبال **سازگاری 100٪** هستی، هنوز **RSA 2048 یا 3072 بیت** مطمئن‌ترین انتخابه.

---
