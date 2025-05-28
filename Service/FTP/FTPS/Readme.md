To configure FTPS (FTP over SSL/TLS) with a certificate on Ubuntu using **vsftpd**, follow these steps. This guide covers both self-signed and CA-signed certificates.

---

## 1. Install vsftpd

Update your system and install vsftpd:

```bash
sudo apt update
sudo apt install vsftpd
```

---

## 2. Generate or Obtain a Certificate

**Option A: Self-Signed Certificate**

Generate a self-signed certificate (for testing or internal use):

```bash
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
```
When prompted, fill in your details. The certificate and key are combined in one file[3][5][8].

**Option B: CA-Signed Certificate**

If you have a certificate from a Certificate Authority (such as Let's Encrypt or GoDaddy), place the certificate and private key in `/etc/ssl/private/` (or another secure directory). The certificate and key can be in separate files or combined[6][8].

---

## 3. Configure vsftpd for FTPS

Edit the configuration file:

```bash
sudo nano /etc/vsftpd.conf
```

Add or ensure the following lines are present:

```conf
# Enable SSL/TLS
ssl_enable=YES
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES

# Use TLS (recommended)
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO

# Path to certificate and private key
rsa_cert_file=/etc/ssl/private/vsftpd.pem
rsa_private_key_file=/etc/ssl/private/vsftpd.pem
```
If using a CA-signed certificate, update the paths to your certificate and key files[2][4][5].

---

## 4. Restart vsftpd

Apply the changes by restarting the service:

```bash
sudo systemctl restart vsftpd
```

---

## 5. Configure the Firewall (Optional)

Allow FTP and passive mode ports if needed:

```bash
sudo ufw allow 21/tcp
sudo ufw allow 40000:50000/tcp
sudo ufw enable
```
Adjust the passive port range to match your configuration.

---

## 6. Test the FTPS Connection

Use an FTP client like FileZilla. When adding a new site, choose **FTP over TLS (explicit)** or **Require explicit FTP over TLS** as the encryption option. Enter your server IP, username, and password[4][5][8].

---

## Summary Table

| Step                | Command/File                        | Description                        |
|---------------------|-------------------------------------|------------------------------------|
| Install vsftpd      | `sudo apt install vsftpd`           | Installs FTP server                |
| Generate cert       | `openssl req...`                    | Creates self-signed certificate    |
| Configure vsftpd    | `/etc/vsftpd.conf`                  | Sets SSL/TLS options and paths     |
| Restart vsftpd      | `sudo systemctl restart vsftpd`     | Applies configuration              |
| Firewall rules      | `sudo ufw allow ...`                | Opens FTP ports                    |
| Test connection     | FTP client (FileZilla, etc.)        | Verifies FTPS works                |

---

This setup secures your FTP server with SSL/TLS encryption using a certificate. For production, use a certificate from a trusted Certificate Authority[5][8].
