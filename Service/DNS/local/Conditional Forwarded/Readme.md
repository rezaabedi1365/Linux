----------------------------------------------------------------------------------------------
# 4- how to set conditional forwarder ?
----------------------------------------------------------------------------------------------

To set up a conditional forwarder in BIND9 on Ubuntu, follow these steps. A conditional forwarder directs specific domain queries to designated DNS servers while using default resolvers for other requests.

---

## Configuration Steps

**1. Edit BIND’s Configuration File**  
Modify `/etc/bind/named.conf.local` to define the conditional forward zone:

```bash
sudo nano /etc/bind/named.conf.local
```

Add a zone block for the domain you want to forward (e.g., `example.local`):

```bash
zone "example.local" {
    type forward;
    forwarders { 192.168.1.100; 192.168.1.101; };  # Replace with target DNS server IP(s)
};
```

- `type forward`: Specifies this zone uses forwarding.
- `forwarders`: Lists the DNS servers to forward queries to.

**2. Validate Configuration Syntax**  
Check for errors:

```bash
sudo named-checkconf /etc/bind/named.conf.local
```

**3. Restart BIND9**  
Apply changes:

```bash
sudo systemctl restart bind9
```

---

## Example Use Case: Forward `.local` Domains

For a `.local` domain (common in private networks):

```bash
zone "local" {
    type forward;
    forwarders { 10.0.0.2; };  # Internal DNS server for .local
};
```

---

## Verification

Test with `dig` to ensure forwarding works:

```bash
dig @127.0.0.1 server.example.local
```

Successful responses will show the IP address resolved via the specified forwarder.

---

