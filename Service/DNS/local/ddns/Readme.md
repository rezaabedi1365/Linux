To automatically synchronize DNS records with DHCP leases on Ubuntu, you configure **Dynamic DNS (DDNS)** updates between the ISC DHCP server and BIND9 DNS server. This setup allows DHCP to dynamically update DNS records whenever a client obtains or releases an IP address.

Here is a concise guide based on best practices and examples:

---

## 1. Generate a Shared Key for Secure Updates

On the DNS server, create a TSIG key that both DHCP and DNS will use to authenticate updates:

```bash
cd /etc/bind
sudo ddns-confgen -a hmac-sha256
```

This outputs a key block like:

```bash
key "dhcp_update_key" {
    algorithm hmac-sha256;
    secret "base64-secret-string==";
};
```

Save this key in a file, e.g., `/etc/bind/ddns.key`:

```bash
sudo nano /etc/bind/ddns.key
```

Paste the key block and save.

Set appropriate permissions:

```bash
sudo chown root:bind /etc/bind/ddns.key
sudo chmod 640 /etc/bind/ddns.key
```

---

## 2. Configure BIND9 to Allow Dynamic Updates

### a. Move zone files to writable location

Because BIND needs to update zone files dynamically, move your zone files to `/var/lib/bind`:

```bash
sudo mv /etc/bind/db.sanbod.tech /var/lib/bind/
sudo mv /etc/bind/db.1.168.192 /var/lib/bind/   # example reverse zone
```

### b. Edit `/etc/bind/named.conf.local` to include the key and allow updates

```bash
include "/etc/bind/ddns.key";

zone "sanbod.tech" {
    type master;
    file "/var/lib/bind/db.sanbod.tech";
    update-policy {
        grant dhcp_update_key wildcard sanbod.tech A;
        grant dhcp_update_key wildcard sanbod.tech TXT;
    };
};

zone "1.168.192.in-addr.arpa" {
    type master;
    file "/var/lib/bind/db.1.168.192";
    update-policy {
        grant dhcp_update_key wildcard 1.168.192.in-addr.arpa PTR;
    };
};
```

This configuration allows the DHCP server authenticated with `dhcp_update_key` to update A, PTR, and TXT records dynamically.

### c. Check BIND configuration and restart

```bash
sudo named-checkconf
sudo systemctl restart bind9
```

---

## 3. Configure ISC DHCP Server for DDNS Updates

### a. Copy the key to DHCP server config directory

```bash
sudo mkdir -p /etc/dhcp/ddns-keys
sudo cp /etc/bind/ddns.key /etc/dhcp/ddns-keys/ddns.key
sudo chown root:dhcp /etc/dhcp/ddns-keys/ddns.key
sudo chmod 640 /etc/dhcp/ddns-keys/ddns.key
```

### b. Edit `/etc/dhcp/dhcpd.conf` to enable DDNS

Add the following:

```bash
include "/etc/dhcp/ddns-keys/ddns.key";

ddns-updates on;
ddns-update-style standard;
ignore client-updates;

key dhcp_update_key {
    algorithm hmac-sha256;
    secret "base64-secret-string==";  # same secret as in ddns.key
};

zone sanbod.tech. {
    primary 127.0.0.1;  # IP of your DNS server
    key dhcp_update_key;
}

zone 1.168.192.in-addr.arpa. {
    primary 127.0.0.1;
    key dhcp_update_key;
}
```

Make sure to replace `"base64-secret-string=="` with the actual secret from your key file.

### c. Restart DHCP server

```bash
sudo systemctl restart isc-dhcp-server
```

---

## 4. Additional Tips

- **Freeze/Thaw Zones**: Before making manual edits to zone files, run:

```bash
sudo rndc freeze sanbod.tech
# make edits
sudo rndc thaw sanbod.tech
```

- **Check Logs**: Monitor `/var/log/syslog` for DHCP and BIND update errors:

```bash
sudo tail -f /var/log/syslog
```

- **Permissions**: Ensure BIND can write to zone files and journal files in `/var/lib/bind`.

---

## Summary

- Generate a TSIG key for secure updates.
- Configure BIND zones with `update-policy` allowing the DHCP server to update DNS.
- Configure ISC DHCP server to use the same key and enable DDNS updates.
- Restart both services and verify dynamic DNS updates occur when clients get DHCP leases.

This approach automates DNS record registration and removal in sync with DHCP leases on Ubuntu using BIND9 and ISC DHCP server[1][4][6].

