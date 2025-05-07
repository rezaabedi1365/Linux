
ip link and ip address and ip route commands

The `ip` command in Linux is a powerful tool to manage network interfaces, IP addresses, and routing. It uses objects like `link`, `addr`, and `route` with commands such as `show`, `add`, and `del`.

## ip link
- Manages network interfaces (links).
- `ip link show`: Lists all network interfaces with their status and details.
- `ip link ls up`: Shows only interfaces that are up.
- `ip link show dev [device]`: Shows details for a specific interface.
- `ip -s link`: Shows statistics like packets transferred, errors, and drops for all interfaces or a specific one with `ip -s link ls [interface]`[1][5].

## ip address
- Manages IP addresses assigned to interfaces.
- `ip addr show`: Displays IP addresses on all interfaces.
- `sudo ip addr add [IP]/[netmask] dev [interface]`: Adds an IP address to an interface.
- `sudo ip addr del [IP]/[netmask] dev [interface]`: Removes an IP address from an interface[4][5].

## ip route
- Manages the routing table.
- `ip route show`: Displays current routing table.
- `sudo ip route add [network]/[mask] via [gateway] dev [interface]`: Adds a route via a gateway.
- `sudo ip route add [network]/[mask] dev [interface]`: Adds a route directly via an interface.
- `sudo ip route del [network]/[mask]`: Deletes a route[2][3][5].

These commands allow you to view and configure network interfaces, assign IPs, and control routing on Linux systems efficiently. 

For example, to see all interfaces:  
`ip link show`

To add an IP to eth0:  
`sudo ip addr add 192.168.1.100/24 dev eth0`

To add a route via gateway 192.168.1.1:  
`sudo ip route add 192.168.2.0/24 via 192.168.1.1 dev eth0`[1][4][5].

Citations:
[1] Linux ip Command with Examples {+ ip Cheat Sheet} - phoenixNAP https://phoenixnap.com/kb/linux-ip-command-examples
[2] [PDF] ip COMMAND CHEAT SHEET https://access.redhat.com/sites/default/files/attachments/rh_ip_command_cheatsheet_1214_jcs_print.pdf
[3] Exploring the Linux 'ip' Command - Cisco Blogs https://blogs.cisco.com/learning/exploring-the-linux-ip-command
[4] How to Use the ip Command in Linux | Linode Docs https://www.linode.com/docs/guides/how-to-use-the-linux-ip-command/
[5] How to Use the ip Command in Linux: A Comprehensive Tutorial https://hostman.com/tutorials/how-to-use-the-ip-command-in-linux/
[6] Linux-ip-route-reference-by-examples.adoc - GitHub https://github.com/yuriskinfo/cheat-sheets/blob/master/cheat-sheets/Linux-ip-route-reference-by-examples.adoc
