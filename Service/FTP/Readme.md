
To install and configure an FTP server on Ubuntu Linux, the recommended and most secure option is **vsftpd** (Very Secure FTP Daemon). Here is a step-by-step guide:

---

## 1. Update Your System

```bash
sudo apt update
```
This ensures your package list is up to date[2][5][7].

---

## 2. Install vsftpd

```bash
sudo apt install vsftpd
```
This installs the FTP server software[2][5][7].

---

## 3. Start and Enable vsftpd

```bash
sudo systemctl start vsftpd
sudo systemctl enable vsftpd
```
This starts the FTP service and enables it to launch at boot[2][5][7].

---

## 4. Backup the Configuration File

```bash
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.bak
```
This creates a backup of the default configuration[2][6].

---

## 5. Configure vsftpd

Edit the main configuration file:

```bash
sudo nano /etc/vsftpd.conf
```

**Common configuration options:**

- **Allow local users to log in:**  
  `local_enable=YES`
- **Enable write permissions:**  
  `write_enable=YES`
- **Lock users to their home directories (for security):**  
  `chroot_local_user=YES`
- **Allow passive mode (useful behind NAT):**  
  ```
  pasv_enable=YES
  pasv_min_port=40000
  pasv_max_port=50000
  ```
  Adjust the port range as needed.

**Example minimal configuration:**

```conf
local_enable=YES
write_enable=YES
chroot_local_user=YES
pasv_enable=YES
pasv_min_port=40000
pasv_max_port=50000
```

Save and exit the editor.

---

## 6. Create an FTP User

Create a dedicated user for FTP access (optional):

```bash
sudo useradd -m ftpuser
sudo passwd ftpuser
```
Replace `ftpuser` with your desired username[2][7].

---

## 7. Configure the Firewall

Allow FTP traffic (ports 20, 21, and passive range):

```bash
sudo ufw allow 20/tcp
sudo ufw allow 21/tcp
sudo ufw allow 40000:50000/tcp
sudo ufw enable
```
This opens the necessary ports for FTP[2][6].

---

## 8. Restart vsftpd

```bash
sudo systemctl restart vsftpd
```
This applies your configuration changes[7].

---

## 9. Connect to the FTP Server

Use an FTP client (e.g., FileZilla, or the command line):

```bash
ftp your-server-ip
```
Log in with the username and password you created[2][7].

---

## Summary Table

| Step                | Command/File                        | Description                      |
|---------------------|-------------------------------------|----------------------------------|
| Update system       | `sudo apt update`                   | Updates package list             |
| Install vsftpd      | `sudo apt install vsftpd`           | Installs FTP server              |
| Start/enable        | `sudo systemctl start/enable vsftpd`| Runs FTP service                 |
| Backup config       | `sudo cp /etc/vsftpd.conf.bak`      | Backs up configuration           |
| Configure           | `/etc/vsftpd.conf`                  | Sets FTP options                 |
| Create user         | `sudo useradd -m ftpuser`           | Creates FTP user                 |
| Firewall rules      | `sudo ufw allow ...`                | Opens FTP ports                  |
| Restart vsftpd      | `sudo systemctl restart vsftpd`     | Applies configuration            |
| Connect             | `ftp your-server-ip`                | Connects to FTP server           |

---

This setup provides a secure and functional FTP server on Ubuntu Linux[2][6][7].

