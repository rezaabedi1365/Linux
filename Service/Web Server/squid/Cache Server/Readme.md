To configure a Squid server as a caching proxy server (also known as cache server mode), you need to set up Squid to store and serve frequently accessed web content, reducing bandwidth usage and improving response times for clients[5][6][4]. Here’s how to do this on Ubuntu Linux:

## Key Configuration for Caching Proxy Mode

**1. Install Squid**

```bash
sudo apt update
sudo apt install squid
```

**2. Configure `/etc/squid/squid.conf`**

The main configuration file is `/etc/squid/squid.conf`. To operate as a caching proxy, you must define cache directories and memory allocation, and set up access controls[5][6][4].

Below is a sample configuration for a basic caching proxy:

```conf
http_port 3128

# Define memory and disk cache
cache_mem 256 MB
cache_dir ufs /var/spool/squid 2000 16 256

# Access control lists
acl localnet src 192.168.1.0/24
acl localhost src 127.0.0.1/255.255.255.255

# Safe ports
acl Safe_ports port 80          # http
acl Safe_ports port 443         # https
acl Safe_ports port 210         # wais
acl Safe_ports port 119         # nntp
acl Safe_ports port 70          # gopher
acl Safe_ports port 21          # ftp
acl Safe_ports port 1025-65535  # unregistered ports

acl CONNECT method CONNECT

# Allow localnet and localhost
http_access allow localnet
http_access allow localhost
http_access deny !Safe_ports
http_access deny CONNECT
http_access deny all

# Email for cache manager
cache_mgr admin@yourdomain.com

# Run as user/group squid
cache_effective_user squid
cache_effective_group squid
```
- **cache_mem**: Amount of RAM for in-memory objects.
- **cache_dir**: Directory, size (MB), subdirectories, and subdirectory size for disk cache.
- **acl**: Access control lists to restrict who can use the proxy.
- **http_access**: Rules to allow or deny access.

**3. Initialize the Cache Directory**

Before starting Squid, initialize the cache directories:

```bash
sudo squid -z
```

**4. Start and Enable Squid**

```bash
sudo systemctl start squid
sudo systemctl enable squid
```

**5. (Optional) Cache Hierarchy**

If you want to connect your Squid cache to other proxy caches (parent or sibling), use the `cache_peer` directive:

```conf
cache_peer parent.example.com parent 3128 3130 default no-query
```
This enables hierarchical caching and improves cache sharing[4].

## Summary Table

| Step                  | Command/File                | Description                                 |
|-----------------------|-----------------------------|---------------------------------------------|
| Install Squid         | `sudo apt install squid`    | Installs Squid proxy/cache server           |
| Configure cache       | `/etc/squid/squid.conf`     | Sets memory, disk cache, and ACLs           |
| Initialize cache      | `sudo squid -z`             | Creates cache directories                   |
| Start/enable Squid    | `sudo systemctl start squid`| Runs Squid as a service                     |
| Cache hierarchy       | `cache_peer` in squid.conf  | Connects to other proxy caches              |

This setup turns your Squid server into a powerful caching proxy, optimizing web access for your network[5][6][4].

