Here is a concise guide to installing and configuring HAProxy on Ubuntu Linux for load balancing and proxying HTTP traffic:

## Installation

1. **Update Your System**

   ```bash
   sudo apt update
   sudo apt upgrade -y
   ```
   This ensures your system is up to date[6].

2. **Install HAProxy**

   ```bash
   sudo apt install haproxy
   ```
   This installs the latest stable version from the Ubuntu repository[6][5].

## Basic Configuration

1. **Edit the HAProxy Configuration File**

   ```bash
   sudo nano /etc/haproxy/haproxy.cfg
   ```
   This is the main configuration file for HAProxy[6][5].

2. **Add or Modify Configuration for Load Balancing**

   For example, to balance HTTP traffic between two backend servers, add the following at the end of the file:

   ```conf
   frontend myapp
     bind *:80
     mode http
     default_backend backend_servers

   backend backend_servers
     mode http
     balance roundrobin
     server webserver1 192.168.0.101:80 check
     server webserver2 192.168.0.102:80 check
   ```
   - **frontend**: Listens on port 80 and forwards requests to the backend.
   - **backend**: Defines the servers to balance traffic between, using the `roundrobin` algorithm[6][8].
   - **server**: Replace IPs and ports with your actual backend servers.

3. **Save and Exit**

   Press `Ctrl+O` to save and `Ctrl+X` to exit.

## Start and Enable HAProxy

1. **Start HAProxy**

   ```bash
   sudo systemctl start haproxy
   ```

2. **Enable HAProxy to Start at Boot**

   ```bash
   sudo systemctl enable haproxy
   ```
   This ensures HAProxy will start automatically after a reboot[6][5].

## Verification

- **Check HAProxy Status**

  ```bash
  sudo systemctl status haproxy
  ```
- **Access Your Load Balancer**

  Open a browser and navigate to your HAProxy server’s IP address. Requests will be distributed to your backend servers[6].

## Additional Options

- **Authentication**: You can set up basic authentication by adding user/password directives in the configuration[7].
- **SSL/TLS**: For HTTPS, add `bind *:443` and SSL certificate configuration in the frontend section.

---

HAProxy is a powerful and flexible open-source solution for load balancing and proxying HTTP, TCP, and other protocols on Ubuntu Linux[6][5][8].

