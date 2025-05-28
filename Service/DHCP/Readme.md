Setting up and managing DHCP (Dynamic Host Configuration Protocol) on Ubuntu Linux involves installing the ISC DHCP server package, configuring network settings, editing configuration files, and ensuring proper firewall and service management. Below is a step-by-step guide tailored for Ubuntu.

## DHCP Server Setup on Ubuntu

**1. Install the DHCP Server**

To install the ISC DHCP server, run:

```bash
sudo apt update
sudo apt install isc-dhcp-server
```
This will install the necessary DHCP server software[2][5][6].

**2. Configure Network Interface**

Before starting the DHCP server, ensure the interface you want to use (e.g., `eth0`) has a static IP address within the subnet you plan to serve. For example, if your subnet is `192.168.1.0/24`, assign `192.168.1.1` to `eth0`[7].

**3. Specify the Listening Interface**

Edit the following file to specify which interface the DHCP server should listen on:

```bash
sudo nano /etc/default/isc-dhcp-server
```
Set the `INTERFACES` variable to your interface name, for example:

```
INTERFACES="eth0"
```
This tells the DHCP server to respond to requests on `eth0`[2][6][7].

**4. Configure the DHCP Server**

Edit the main configuration file:

```bash
sudo nano /etc/dhcp/dhcpd.conf
```
Add your subnet configuration. Here is an example configuration for a subnet:

```conf
subnet 192.168.1.0 netmask 255.255.255.0 {
  range 192.168.1.100 192.168.1.200;
  option domain-name-servers 8.8.8.8, 8.8.4.4;
  option domain-name "example.local";
  option routers 192.168.1.1;
  option broadcast-address 192.168.1.255;
  default-lease-time 600;
  max-lease-time 7200;
}
```
This defines the IP range, DNS servers, domain name, gateway, and lease times[2][6][7].

**Optional: Assign a Static IP to a Client**

To assign a fixed IP to a specific client based on its MAC address, add:

```conf
host myclient {
  hardware ethernet 00:0C:29:05:A7:CB;
  fixed-address 192.168.1.110;
}
```
Replace the MAC address and IP as needed[2][6].

**5. Open Firewall Ports**

Allow DHCP traffic on UDP ports 67 and 68:

```bash
sudo ufw allow 67/udp
sudo ufw allow 68/udp
sudo ufw reload
```
This ensures DHCP requests and responses are not blocked[5][6].

**6. Start and Enable the DHCP Service**

Restart the DHCP server to apply changes and enable it to start at boot:

```bash
sudo systemctl restart isc-dhcp-server
sudo systemctl enable isc-dhcp-server
```
Check the status with:

```bash
sudo systemctl status isc-dhcp-server
```
If there are errors, check logs at `/var/log/syslog` or `/var/log/daemon.log`[6][7].

## DHCP Client Configuration on Ubuntu

To configure a client to use DHCP, edit the network configuration for your interface. For example, in `/etc/network/interfaces`:

```
iface eth0 inet dhcp
```
Or, if using Netplan (Ubuntu 18.04+), set `dhcp4: true` under your interface in the YAML configuration file[8].

To manually request an IP from a DHCP server, use:

```bash
sudo dhclient eth0
```
To release the current lease, use:

```bash
sudo dhclient -r eth0
```
This forces the client to request a new IP[8].

## Summary Table

| Step                    | Command/File                                | Description                                      |
|-------------------------|---------------------------------------------|--------------------------------------------------|
| Install DHCP Server     | `sudo apt install isc-dhcp-server`          | Installs ISC DHCP server                         |
| Set Static IP           | `/etc/network/interfaces` or `netplan`      | Assigns static IP to server interface            |
| Specify Interface       | `/etc/default/isc-dhcp-server`              | Tells DHCP server which interface to listen on   |
| Configure Subnet        | `/etc/dhcp/dhcpd.conf`                      | Defines IP range, DNS, gateway, etc.             |
| Assign Static Lease     | `/etc/dhcp/dhcpd.conf`                      | Assigns fixed IP to specific MAC                 |
| Open Firewall Ports     | `sudo ufw allow 67/udp` and `68/udp`        | Allows DHCP traffic                              |
| Start/Enable Service    | `sudo systemctl restart/enable isc-dhcp-server` | Starts and enables DHCP service              |
| Client DHCP Config      | `/etc/network/interfaces` or `dhclient`     | Configures client to use DHCP                    |

This process will set up a fully functional DHCP server and client on Ubuntu Linux[2][6][7].


