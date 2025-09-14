To disable DHCP for IPv4 on Oracle Linux (including version 9.5), you typically configure your network interface to use a static IP instead of DHCP. Since Oracle Linux 9 uses NetworkManager by default, the best way is to modify the connection profile with `nmcli` to set IPv4 method to manual (static) rather than auto (DHCP).

## How to disable DHCP and set static IP using `nmcli`

1. **List your network connections:**
   ```bash
   nmcli connection show
   ```
   Identify the connection name you want to configure (e.g., `ens33`).

2. **Disable DHCP and set static IP:**
  ```bash
nmcli connection modify ens33 ipv4.addresses 192.168.1.100/24
nmcli connection modify ens33 ipv4.gateway 192.168.1.1
nmcli connection modify ens33 ipv4.dns "8.8.8.8 4.2.2.4"
nmcli connection modify ens33 ipv4.method manual

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
address1=YOUR_IP/NETMASK,GATEWAY
dns=DNS1;DNS2;
```

Then restart NetworkManager:
```bash
systemctl restart NetworkManager
```

---
If your network goes down after some time on Oracle Linux, it could be due to several reasons such as DHCP lease expiration, NetworkManager issues, or hardware/link problems. Here are some troubleshooting tips and steps to diagnose and fix the issue:

## Troubleshooting Steps for Network Going Down

1. **Check NetworkManager Logs**
   NetworkManager manages networking on Oracle Linux 9. Check its logs for errors:
   ```bash
   journalctl -u NetworkManager -f
   ```
   This will show real-time logs which might indicate why the network goes down.

2. **Verify DHCP Lease**
   If your IP is assigned via DHCP, the lease might expire or renew improperly:
   ```bash
   nmcli device show 
   ```
   Look for DHCP lease times and renewal status.

3. **Check Interface Status**
   Use `ip` or `nmcli` to see if the interface goes down:
   ```bash
   ip link show 
   nmcli device status
   ```
   Look for "disconnected" or "unavailable" states.


4. **Restart Network Connection**
   Restarting the connection can temporarily fix the issue:
   ```bash
   nmcli connection down 
   nmcli connection up 
   ```

5. **Check for Power Management or Link Issues**
   Sometimes NIC power saving or link negotiation causes drops. Disable power management on the NIC or check cable/switch.

6. **Make Network Configuration Persistent and Correct**
   Oracle Linux 9 uses NetworkManager profiles stored in `/etc/NetworkManager/system-connections/`. Ensure your static IP, gateway, and DNS are correctly configured there to avoid DHCP conflicts or misconfigurations that cause drops[2].



