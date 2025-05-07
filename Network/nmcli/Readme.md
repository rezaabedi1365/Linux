To disable DHCP for IPv4 on Oracle Linux (including version 9.5), you typically configure your network interface to use a static IP instead of DHCP. Since Oracle Linux 9 uses NetworkManager by default, the best way is to modify the connection profile with `nmcli` to set IPv4 method to manual (static) rather than auto (DHCP).

## How to disable DHCP and set static IP using `nmcli`

1. **List your network connections:**
   ```bash
   nmcli connection show
   ```
   Identify the connection name you want to configure (e.g., `ens33`).

2. **Disable DHCP and set static IP:**
   Replace ``, `/`, ``, and `` with your values:
   ```bash
   nmcli connection modify  ipv4.method manual
   nmcli connection modify  ipv4.addresses /
   nmcli connection modify  ipv4.gateway 
   nmcli connection modify  ipv4.dns " "
   ```

3. **Bring the connection down and up to apply changes:**
   ```bash
   nmcli connection down 
   nmcli connection up 
   ```

4. **Verify the IP and DHCP status:**
   ```bash
   nmcli device show 
   ```
   You should see `IP4.METHOD: manual` indicating DHCP is disabled.

---

## Alternative: Editing NetworkManager config files

You can also edit the connection file under `/etc/NetworkManager/system-connections/` and set:
```
[ipv4]
method=manual
address1=/,
dns=;;
```
Then restart NetworkManager:
```bash
systemctl restart NetworkManager
```

---

