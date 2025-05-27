To configure DNS for the domain **sanbod.tech** on an Ubuntu Linux server using BIND9 as the primary DNS server, follow these steps:

----------------------------------------------------------------------------------------------
# 1- install
-----------------------------------------------------------------------------------------------

Update your system and install BIND9:

```bash
sudo apt update
sudo apt install bind9 bind9utils bind9-doc -y
```

----------------------------------------------------------------------------------------------
# 2- Forward Lookup Zone
----------------------------------------------------------------------------------------------
### a. Define the zone in BIND configuration

Edit the file `/etc/bind/named.conf.local` to add your domain zone:

```bash
sudo nano /etc/bind/named.conf.local
```

Add the following zone block:

```bash
zone "sanbod.tech" {
    type master;
    file "/etc/bind/zones/db.sanbod.tech";
    allow-transfer { none; };  # Adjust if you have secondary DNS servers
};
```

Save and exit.

### b. Create the zone file

Create the directory for zone files if it doesn't exist:

```bash
sudo mkdir -p /etc/bind/zones
```

Copy a template zone file and edit it:

```bash
sudo cp /etc/bind/db.local /etc/bind/zones/db.sanbod.tech
sudo nano /etc/bind/zones/db.sanbod.tech
```

Edit the file with entries for your domain. Example:

```
$TTL 604800
@   IN  SOA ns1.sanbod.tech. admin.sanbod.tech. (
        2025052701  ; Serial (YYYYMMDDnn)
        604800      ; Refresh
        86400       ; Retry
        2419200     ; Expire
        604800 )    ; Negative Cache TTL
;
@       IN  NS      ns1.sanbod.tech.
ns1     IN  A       
@       IN  A       
www     IN  A       
mail    IN  A          # if applicable
@       IN  MX 10   mail.sanbod.tech.       # if you have mail server
```

- Replace `` with your DNS server's IP address.
- Replace `` with the IP address where sanbod.tech is hosted.
- Adjust mail server records if you use mail services.

### c. Check the zone file syntax

Run:

```bash
sudo named-checkzone sanbod.tech /etc/bind/zones/db.sanbod.tech
```


----------------------------------------------------------------------------------------------
# 3- reverse lookup zone
----------------------------------------------------------------------------------------------
A **reverse lookup zone** in DNS is a special authoritative zone used to resolve IP addresses back to domain names, essentially performing the opposite function of a forward lookup zone[1][2][3].

## What Is a Reverse Lookup Zone?

- It maps IP addresses to hostnames using **PTR (Pointer) records**.
- It is essential for network troubleshooting, security analysis, and verifying the authenticity of servers (e.g., in email systems).
- The reverse DNS namespace uses the special domain **`in-addr.arpa`** for IPv4 addresses, where the IP address octets are reversed to form the zone name (e.g., for IP `192.168.1.x`, the reverse zone is `1.168.192.in-addr.arpa`)[3][6].
- For IPv6, the domain used is `ip6.arpa`.

## Purpose and Uses

- Helps identify the hostname associated with an IP address.
- Used in cybersecurity to trace sources of network activity.
- Email servers use reverse DNS to validate sending servers and reduce spam.
- Assists in network diagnostics and enforcing security policies[2][5][7].

## How Reverse Lookup Works

1. The IP address is reversed and appended with `.in-addr.arpa`.
2. A DNS query is made for the PTR record in that reverse zone.
3. The PTR record returns the canonical hostname for the IP.

---

## Example: Configuring a Reverse Lookup Zone in BIND9 on Ubuntu

1. **Define the reverse zone** in `/etc/bind/named.conf.local`:

```bash
zone "1.168.192.in-addr.arpa" {
    type master;
    file "/etc/bind/zones/db.192.168.1";
};
```

2. **Create the reverse zone file** `/etc/bind/zones/db.192.168.1` with PTR records:

```
$TTL 604800
@   IN  SOA ns1.sanbod.tech. admin.sanbod.tech. (
        2025052701 ; Serial
        604800     ; Refresh
        86400      ; Retry
        2419200    ; Expire
        604800 )   ; Negative Cache TTL
;
@       IN  NS      ns1.sanbod.tech.
1       IN  PTR     host1.sanbod.tech.
20      IN  PTR     sanbod.tech.
30      IN  PTR     mail.sanbod.tech.
```

- Here, `1`, `20`, and `30` correspond to the last octet of IP addresses in the subnet `192.168.1.x`.
- Each PTR record maps an IP to a hostname.

3. **Check the zone file syntax**:

```bash
sudo named-checkzone 1.168.192.in-addr.arpa /etc/bind/zones/db.192.168.1
```

4. **Restart BIND**:

```bash
sudo systemctl restart bind9
```

5. **Test reverse lookup**:

```bash
dig -x 192.168.1.20
```

You should get the hostname `sanbod.tech` in the answer.

---


----------------------------------------------------------------------------------------------
# 5- Configure BIND Options (Optional)
----------------------------------------------------------------------------------------------

Edit `/etc/bind/named.conf.options` to set forwarders (external DNS servers) for queries your server cannot resolve:

```bash
sudo nano /etc/bind/named.conf.options
```

Inside the `options` block, add:

```bash
forwarders {
    8.8.8.8;
    8.8.4.4;
};
```
Save and exit.

----------------------------------------------------------------------------------------------
# 6- Restart BIND9 Service
----------------------------------------------------------------------------------------------
Apply all changes:

```bash
sudo systemctl restart bind9
```


