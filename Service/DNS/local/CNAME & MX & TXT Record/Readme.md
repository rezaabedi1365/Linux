To create **CNAME**, **TXT**, and **MX** DNS records on an Ubuntu server running BIND9, you need to add the appropriate entries in your zone file for your domain.

---

## Step-by-Step Guide to Create CNAME, TXT, and MX Records

### 1. Locate Your Zone File

Zone files are usually located in `/etc/bind/zones/` or `/var/lib/bind/`. For example:

```
/etc/bind/zones/db.sanbod.tech
```

Open your zone file with a text editor:

```bash
sudo nano /etc/bind/zones/db.sanbod.tech
```

---

### 2. Add DNS Records

Here is how to add each record type:

#### a. CNAME Record (Alias)

A CNAME record points one domain name to another domain name.

```dns
alias    IN  CNAME   target.domain.com.
```

**Example:**

```dns
www      IN  CNAME   sanbod.tech.
```

This means `www.sanbod.tech` is an alias for `sanbod.tech`.

---

#### b. TXT Record (Text)

TXT records store arbitrary text data, often used for SPF, DKIM, verification, etc.

```dns
@        IN  TXT     "v=spf1 include:_spf.google.com ~all"
```

Or for a subdomain:

```dns
google._domainkey    IN  TXT "k=rsa; p=MIIBIjANBgkqh..."
```

---

#### c. MX Record (Mail Exchange)

MX records specify mail servers for the domain and their priority.

```dns
@        IN  MX 10   mail.sanbod.tech.
mail     IN  A       192.168.1.30
```

- `@` represents the root of the zone (`sanbod.tech`).
- `10` is the priority; lower values mean higher priority.
- `mail.sanbod.tech.` should have an A record pointing to the mail server IP.

---

### 3. Example Zone File Snippet

```dns
$TTL 604800
@       IN  SOA ns1.sanbod.tech. admin.sanbod.tech. (
            2025052701 ; Serial
            604800     ; Refresh
            86400      ; Retry
            2419200    ; Expire
            604800 )   ; Negative Cache TTL
;

@       IN  NS      ns1.sanbod.tech.
ns1     IN  A       192.168.1.10

sanbod.tech.      IN  A       192.168.1.20
www               IN  CNAME   sanbod.tech.

@                 IN  MX 10   mail.sanbod.tech.
mail              IN  A       192.168.1.30

@                 IN  TXT     "v=spf1 include:_spf.google.com ~all"
google._domainkey  IN  TXT     "k=rsa; p=MIIBIjANBgkqh..."
```

---

### 4. Check Zone File Syntax

Always validate your zone file before restarting BIND:

```bash
sudo named-checkzone sanbod.tech /etc/bind/zones/db.sanbod.tech
```

Fix any errors reported.

---

### 5. Reload or Restart BIND

After successful validation, reload the zone or restart BIND:

```bash
sudo rndc reload sanbod.tech
# or restart BIND
sudo systemctl restart bind9
```

---

## Summary

| Record Type | Purpose                          | Example Entry                              |
|-------------|---------------------------------|-------------------------------------------|
| CNAME       | Alias one name to another       | `www IN CNAME sanbod.tech.`               |
| TXT         | Store text (SPF, DKIM, etc.)    | `@ IN TXT "v=spf1 include:_spf.google.com ~all"` |
| MX          | Mail server priority and address| `@ IN MX 10 mail.sanbod.tech.` + A record for mail |

---

If you want, I can help you generate specific records for your domain — just provide the details!

---
Answer from Perplexity: pplx.ai/share
