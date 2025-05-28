Setting up a Squid proxy server on Ubuntu Linux is straightforward. Squid is a widely used, open-source proxy and cache server that supports HTTP, HTTPS, FTP, and more, and it helps optimize bandwidth, improve speed, and enhance security[4][8][5].

## Installation and Basic Configuration

**1. Update Your System**

Start by updating your package lists and upgrading installed packages:

```bash
sudo apt update
sudo apt upgrade -y
```
This ensures you have the latest security patches and software[5][8].

**2. Install Squid**

Install Squid using the following command:

```bash
sudo apt install squid -y
```
Squid and its dependencies will be installed automatically[2][4][8].

**3. Configure Squid**

Edit the main configuration file:

```bash
sudo nano /etc/squid/squid.conf
```
Key configuration options include:

- **Listening Port:**  
  Find the line `http_port 3128` and ensure it is uncommented (remove the `#` if present)[6][10].
- **Access Control:**  
  By default, Squid denies all access. To allow all clients, change the line:
  ```
  http_access deny all
  ```
  to
  ```
  http_access allow all
  ```
  Alternatively, to restrict access to specific networks, use ACLs (Access Control Lists). For example:
  ```
  acl our_networks src 192.168.1.0/24
  http_access allow our_networks
  http_access deny all
  ```
  This allows only clients from the `192.168.1.0/24` network[10].

Save and exit the editor.

**4. Start and Enable Squid**

Start the Squid service and enable it to launch at boot:

```bash
sudo systemctl start squid
sudo systemctl enable squid
```
Check the service status:

```bash
sudo systemctl status squid
```
This confirms Squid is running[6][8].

## Additional Features

- **Authentication:**  
  To require a username and password for proxy access, configure authentication using `htpasswd` or similar tools[7].
- **Transparent Proxy:**  
  Squid can be configured to intercept and proxy all HTTP traffic without client configuration, useful in corporate environments[4].
- **Caching:**  
  Squid caches frequently accessed content, reducing bandwidth usage and improving response times[8].

## Client Configuration

To use the Squid proxy, configure your client (web browser, system settings, etc.) to use the proxy server’s IP address and port (`3128` by default).

## Summary Table

| Step                | Command/File                           | Description                        |
|---------------------|----------------------------------------|------------------------------------|
| Update system       | `sudo apt update && sudo apt upgrade`  | Updates all packages               |
| Install Squid       | `sudo apt install squid`               | Installs Squid proxy               |
| Configure Squid     | `/etc/squid/squid.conf`                | Sets listening port, ACLs, etc.    |
| Start Squid         | `sudo systemctl start squid`           | Starts the Squid service           |
| Enable Squid        | `sudo systemctl enable squid`          | Enables Squid at boot              |

Squid is a powerful and flexible proxy server suitable for a wide range of use cases on Ubuntu Linux[4][8][5].


