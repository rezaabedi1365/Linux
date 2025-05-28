To configure a Squid proxy on Ubuntu Linux with Active Directory (AD) authentication, you can use LDAP-based authentication to validate usernames and passwords against your AD domain. This setup requires careful configuration of the Squid configuration file and preparation of an AD service account for LDAP queries.

## Steps to Configure Squid with Active Directory Authentication

**1. Prepare an Active Directory Service Account**

- **Create a dedicated AD user** (e.g., `squidproxy`) for LDAP queries.
- **Set account options:**
  - User must change password at next logon: **Unticked**
  - User cannot change password: **Ticked**
  - Password never expires: **Ticked**
  - Account is disabled: **Unticked**[2][7]
- **Record the user's distinguished name (DN)** and password for use in Squid configuration.

**2. Install Required Packages**

Install Squid and, if needed, the LDAP authentication helper:

```bash
sudo apt update
sudo apt install squid squid-ldap-auth
```

**3. Secure LDAP Credentials**

Store the AD service account password securely. For example, create a file readable only by Squid:

```bash
echo 'yourpassword' > /etc/squid/ldappass.txt
sudo chmod o-r /etc/squid/ldappass.txt
sudo chgrp proxy /etc/squid/ldappass.txt
```
Replace `yourpassword` with the actual password for your AD service account[2][7].

**4. Configure Squid LDAP Authentication**

Edit `/etc/squid/squid.conf` and add or modify the following lines (adjust parameters to match your AD environment):

```conf
auth_param basic program /usr/lib/squid/basic_ldap_auth -R -b "dc=your,dc=domain,dc=com" -D "cn=squidproxy,cn=Users,dc=your,dc=domain,dc=com" -W /etc/squid/ldappass.txt -f sAMAccountName=%s -h 192.168.1.75
auth_param basic children 5
auth_param basic realm "Your Organisation Name"
auth_param basic credentialsttl 5 minutes

acl ldap_auth proxy_auth REQUIRED
http_access allow ldap_auth
http_access deny all
```
- **-b**: Base distinguished name of your AD domain.
- **-D**: Distinguished name of the AD service account.
- **-W /etc/squid/ldappass.txt**: Path to the file containing the AD service account password.
- **-f sAMAccountName=%s**: Search filter using the sAMAccountName attribute.
- **-h**: IP address or hostname of your AD server[1][2][7].

**5. Restart Squid**

Apply your changes and restart Squid:

```bash
sudo systemctl restart squid
```

**6. Test Authentication**

Configure your browser to use the Squid proxy (default port 3128). When accessing the internet, you should be prompted for your AD username and password.

## Important Notes

- **Transparent Proxy Limitation:** Authentication prompts will not work in transparent proxy mode; users must explicitly configure their browser to use the proxy[3].
- **Group-Based Access:** For more granular control, you can configure Squid to allow access only for users in specific AD groups using external ACL helpers[6][7].
- **Kerberos/NTLM:** For single sign-on (SSO) or seamless authentication, consider using Kerberos or NTLM, but these require additional configuration[2][7].

## Summary Table

| Step                         | Description                                                                 |
|------------------------------|-----------------------------------------------------------------------------|
| Prepare AD service account   | Create and configure AD user for LDAP queries                               |
| Install Squid & LDAP helper  | Install Squid and LDAP authentication package                               |
| Secure LDAP credentials      | Store AD password securely in a file                                        |
| Configure Squid              | Add LDAP auth parameters and ACLs to squid.conf                             |
| Restart Squid                | Apply configuration changes                                                 |
| Test authentication          | Use browser to verify AD authentication works                               |

This setup allows your Squid proxy to authenticate users against Active Directory using LDAP.

