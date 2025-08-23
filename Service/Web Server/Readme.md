.

---

## 🔹 جدول جامع مقایسه Nginx, HAProxy, Apache, Squid

| ویژگی / ابزار                   | **Nginx**                                                       | **HAProxy**                                                    | **Apache (mod\_proxy)**                       | **Squid**                                       |
| ------------------------------- | --------------------------------------------------------------- | -------------------------------------------------------------- | --------------------------------------------- | ----------------------------------------------- |
| **نوع پروکسی**                  | Reverse Proxy + Load Balancer + Web Server                      | Reverse Proxy + Load Balancer                                  | Reverse Proxy + Load Balancer (با mod\_proxy) | Forward Proxy (تمرکز اصلی) + Reverse Proxy      |
| **تمرکز اصلی**                  | وب‌سرور، Reverse Proxy، API Gateway، Caching، Load Balancing    | Load Balancing و High Availability                             | وب‌سرور قدیمی + Proxy                         | Web Caching، ACL، کنترل دسترسی کاربران سازمانی  |
| **لایه کاری**                   | لایه ۴ (TCP/UDP) + لایه ۷ (HTTP/HTTPS)                          | لایه ۴ + لایه ۷                                                | لایه ۷ (HTTP/HTTPS)                           | بیشتر لایه ۷ (HTTP/HTTPS)                       |
| **الگوریتم‌های Load Balancing** | Round Robin, Least Conn, IP Hash (+ پیشرفته در Nginx Plus)      | خیلی زیاد (round robin, least conn, source, uri, hdr, hash, …) | محدود (round robin, least conn, hash)         | خیلی محدود (تقریباً بلااستفاده برای LB)         |
| **Caching**                     | بله (خوب)                                                       | ❌ ندارد                                                        | بله (با mod\_cache)                           | خیلی قوی (Web Cache تخصصی)                      |
| **WAF / امنیت**                 | بله (ModSecurity, TLS termination)                              | ACL قوی، ولی WAF نداره                                         | بله (ModSecurity)                             | ACL خیلی قوی (URL, IP, User, Group)             |
| **SSL/TLS Termination**         | بله (خیلی قوی)                                                  | بله                                                            | بله                                           | بله (ولی محدود)                                 |
| **Performance (کارایی)**        | خیلی سریع (event-driven, async)                                 | فوق‌العاده سریع و پایدار (خصوصاً در TCP/L4)                    | کندتر (process/thread-based)                  | سریع در caching، نه در balancing                |
| **پیکربندی (Config)**           | ساده و خوانا                                                    | دقیق و تخصصی (syntax خاص HAProxy)                              | پیچیده و verbose                              | متوسط (ruleهای ACL زیاد)                        |
| **Health Check**                | بله (پایه‌ای، پیشرفته در Plus)                                  | بله (خیلی قوی و پیشرفته)                                       | بله (پایه‌ای)                                 | محدود                                           |
| **Failover / HA**               | بله                                                             | خیلی قوی                                                       | بله (ساده)                                    | محدود                                           |
| **Sticky Sessions**             | بله (ip\_hash یا hash)                                          | بله (خیلی پیشرفته)                                             | بله (محدود)                                   | ❌                                               |
| **Static File Serving**         | بله (خیلی سریع)                                                 | ❌                                                              | بله (نه به خوبی Nginx)                        | ❌                                               |
| **پشتیبانی از پروتکل‌ها**       | HTTP, HTTPS, TCP, UDP, gRPC, FastCGI                            | TCP, HTTP, HTTPS                                               | HTTP, HTTPS, FastCGI                          | HTTP, HTTPS (Forward Proxy)                     |
| **ویژگی‌های خاص**               | Web server, TLS termination, HTTP/2, gRPC, caching, API Gateway | Load balancing حرفه‌ای، health check عمیق، retry هوشمند        | ماژول‌های زیاد (PHP, CGI, legacy support)     | Filtering, ACL, Caching قوی، استفاده سازمانی    |
| **مناسب برای**                  | وب‌سرورها، API Gateway، Microservices، Cloud Native             | دیتاسنترها، بانک‌ها، ISPها، ترافیک خیلی بالا                   | سایت‌های قدیمی، سازگاری با اپلیکیشن legacy    | سازمان‌ها و ISPها برای مدیریت اینترنت و caching |
| **محبوبیت امروزی**              | خیلی زیاد (DevOps, Cloud, Microservices)                        | خیلی زیاد (دیتاسنترها، سیستم‌های حیاتی)                        | در حال کاهش (بیشتر برای legacy)               | محدود به سازمان‌ها (محبوبیت کمتر از قبل)        |

---

## 🔑 جمع‌بندی خیلی سریع

* **Nginx** → همه‌کاره، مخصوص **وب و API Gateway**، caching + reverse proxy + load balancing.
* **HAProxy** → بهترین برای **Load Balancing حرفه‌ای / High Availability** (خصوصاً TCP و HTTP).
* **Apache** → بیشتر برای **سایت‌ها و سیستم‌های قدیمی**.
* **Squid** → بیشتر برای **Forward Proxy و Caching سازمانی** (نه Load Balancing).

---

