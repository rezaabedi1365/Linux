
دیتابیس‌های معروفی که بیشترین استفاده رو روی لینوکس دارن:

* **MySQL / MariaDB**
* **PostgreSQL**
* **SQLite**
* **MongoDB**
* **Redis**
* **Cassandra**
* **Oracle Database (Linux edition)**

در جدول زیر مهم‌ترین پارامترها رو کنار هم گذاشتم:

| دیتابیس        | نوع (Relational / NoSQL)     | مدل ذخیره‌سازی   | مقیاس‌پذیری          | پشتیبانی ACID        | زبان کوئری        | سرعت (خواندن/نوشتن)             | کاربرد رایج                    | لایسنس             | مصرف منابع      |
| -------------- | ---------------------------- | ---------------- | -------------------- | -------------------- | ----------------- | ------------------------------- | ------------------------------ | ------------------ | --------------- |
| **MySQL**      | Relational (RDBMS)           | جدول‌محور        | عمودی                | بله (InnoDB)         | SQL               | متوسط/خوب                       | وب‌سایت‌ها، اپلیکیشن‌ها        | GPL / تجاری        | متوسط           |
| **MariaDB**    | Relational (Fork MySQL)      | جدول‌محور        | عمودی/نسبتاً افقی    | بله                  | SQL               | کمی سریع‌تر از MySQL            | جایگزین آزاد MySQL             | GPL                | متوسط           |
| **PostgreSQL** | Relational (Object-RDBMS)    | جدول + JSONB     | عمودی + افقی محدود   | بله (خیلی قوی)       | SQL + JSON        | کمی کندتر از MySQL ولی پایدارتر | سیستم‌های مالی، پیچیده         | PostgreSQL License | متوسط تا زیاد   |
| **SQLite**     | Relational (Embedded)        | فایل منفرد       | مقیاس‌پذیر نیست      | بله (محدود)          | SQL               | سریع برای حجم کم                | موبایل، اپلیکیشن سبک           | Public Domain      | کم              |
| **MongoDB**    | NoSQL (Document)             | JSON/BSON        | افقی عالی (Sharding) | تا حدی (قابل تنظیم)  | MQL (Mongo Query) | عالی در خواندن/نوشتن زیاد       | اپلیکیشن‌های Big Data، وب مدرن | SSPL               | متوسط تا زیاد   |
| **Redis**      | NoSQL (Key-Value, In-memory) | حافظه (RAM)      | افقی عالی (Cluster)  | محدود                | دستورات خاص       | بسیار سریع                      | Cache، Queue، Real-time        | BSD                | زیاد (RAM محور) |
| **Cassandra**  | NoSQL (Wide Column)          | توزیع‌شده        | افقی خیلی قوی        | Eventual Consistency | CQL (شبیه SQL)    | بهینه برای نوشتن                | Big Data، IoT                  | Apache License     | زیاد            |
| **Oracle DB**  | Relational (Enterprise)      | جدول‌محور + JSON | عمودی/افقی (Grid)    | بله (کامل)           | SQL / PL/SQL      | بسیار پایدار ولی سنگین          | سازمانی، بانکی                 | تجاری              | زیاد            |

---


