https://www.namecheap.com/support/knowledgebase/article.aspx/9617/69/how-to-convert-certificates-into-different-formats-using-openssl/
- P7B/PKCS#7 -     *.p7b, *.p7s, *.cer
- PFX/P12/PKCS#12  *.p12 ,  *.pfx.
- PEM              *.pem, *.crt , *.cer
- DER/binadr
- x509 -           
------------------------------------------------------------------------
1) PEM is a base64 encoded certificate placed between the headers -----BEGIN CERTIFICATE----- and -----END CERTIFICATE-----. It is the most widespread certificate format, which is mostly used by Linux-based servers, like Apache, Nginx, and by the majority of webhosting control panels (cPanel, Plesk, DirectAdmin, WebMin, etc.). PEM certificates may have the following file extensions: *.pem, *.crt, *.cer. Comodo CA (now Sectigo CA) sends out their certificates in PEM, if any server type except ‘Microsoft Internet Information Server’ (Microsoft IIS) is chosen during the certificate activation.


2) PKCS#7 is another certificate with Base64 encoding that is used generally by Windows and Java-based Tomcat servers, and may contain domain end-entity certificate and CA chain certificates. If you open a PKCS#7 file in a text editor, you can see the encoded text between -----BEGIN PKCS7----- and -----END PKCS7----- tags. The most common extensions are: *.p7b, *.p7s, *.cer. The certificate in PKCS#7 format can be retrieved from Comodo CA (now Sectigo CA), if you choose ‘Microsoft Internet Information Server’ as a server type during the certificate activation.

3) PKCS#12/PFX is a file in binary format that contains the certificate with a corresponding private key and is protected by a password. Optionally, the file can include the CA chain certificates as well. Usually, PFX certificates are used on Windows machines, and are essential for transferring the certificate from one Windows server to another. The file extensions are: *.p12 and *.pfx.


