
---

## 🔹 مقایسه کامل Nginx vs HAProxy vs Apache vs Squid

| ویژگی / ابزار                   | **Nginx**                                                                | **HAProxy**                                                   | **Apache (mod\_proxy)**                                 | **Squid**                                                   |
| ------------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------- | ------------------------------------------------------- | ----------------------------------------------------------- |
| **نوع پروکسی**                  | Reverse Proxy + Load Balancer + Web Server                               | Reverse Proxy + Load Balancer                                 | Reverse Proxy + Load Balancer (به کمک mod\_proxy)       | بیشتر Forward Proxy (برای کلاینت‌ها) + قابلیت Reverse Proxy |
| **تمرکز اصلی**                  | وب‌سرور، API Gateway، Caching، Load Balancing                            | Load Balancing و High Availability (خصوصاً TCP)               | وب‌سرور قدیمی + Proxy                                   | Web Caching، ACL، کنترل دسترسی کاربران به اینترنت           |
| **لایه کاری**                   | لایه ۴ (TCP/UDP) و لایه ۷ (HTTP/HTTPS)                                   | لایه ۴ و لایه ۷                                               | لایه ۷ (HTTP/HTTPS)                                     | بیشتر لایه ۷ (HTTP/HTTPS)                                   |
| **الگوریتم‌های Load Balancing** | Round Robin, Least Conn, IP Hash (+ پیشرفته در Nginx Plus)               | خیلی زیاد: round robin, least conn, source, uri, hdr, hash, … | پایه‌ای: Round Robin, Least Conn, Hash                  | خیلی محدود (تقریباً استفاده نمی‌شه برای load balancing)     |
| **Caching**                     | بله (خوب)                                                                | ❌ ندارد                                                       | بله (با mod\_cache)                                     | خیلی قوی (Web Cache تخصصی)                                  |
| **WAF / امنیت**                 | WAF (با ModSecurity یا نسخه Plus)، TLS termination                       | ACL قوی برای ترافیک، ولی WAF نه                               | WAF (با ModSecurity)                                    | ACL بسیار قوی (URL, IP, User, Group)                        |
| **Performance**                 | خیلی سریع (event-driven)                                                 | فوق‌العاده سریع و پایدار (خصوصاً در لایه ۴)                   | کندتر (process/thread-based)                            | سریع در Caching، نه در load balancing                       |
| **پیکربندی**                    | ساده و خوانا                                                             | دقیق و تخصصی‌تر (syntax خاص HAProxy)                          | verbose و پیچیده‌تر                                     | متوسط (بیشتر برای ACLها و caching ruleها)                   |
| **ویژگی‌های خاص**               | Static file serving, TLS termination, HTTP/2, gRPC, caching, API Gateway | Health check پیشرفته، retry هوشمند، stickiness                | ماژول‌های زیاد (PHP, CGI, legacy support)               | Filtering, ACL, Caching قوی، استفاده سازمانی                |
| **مناسب برای**                  | وب‌سرورها، API Gateway، Microservices، اپلیکیشن‌های مدرن                 | دیتاسنترها، ترافیک بالا، سرویس‌های TCP/HTTP حیاتی             | سایت‌های قدیمی یا نرم‌افزارهایی که به Apache وابسته‌اند | سازمان‌ها و ISPها (برای مدیریت اینترنت و caching)           |
| **محبوبیت امروزی**              | خیلی زیاد (DevOps, Cloud, Microservices)                                 | خیلی زیاد (بانک‌ها، ISPها، دیتاسنترها)                        | در حال کاهش (بیشتر برای legacy)                         | محدود به محیط‌های سازمانی و آکادمیک                         |

---

## 🔑 خلاصه سریع انتخاب

* **Nginx** → همه‌کاره، عالی برای **وب و API**، هم Reverse Proxy هم Load Balancer.
* **HAProxy** → بهترین انتخاب برای **Load Balancing حرفه‌ای و High Availability**.
* **Apache** → بیشتر برای **سایت‌ها و اپلیکیشن‌های قدیمی**.
* **Squid** → بهترین برای **Forward Proxy + Caching + ACL/فیلترینگ اینترنت**.

---

