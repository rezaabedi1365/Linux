https://support.mozilla.org/en-US/kb/setting-certificate-authorities-firefox

    Windows
        - %USERPROFILE%\AppData\Local\Mozilla\Certificates
        - USERPROFILE%\AppData\Roaming\Mozilla\Certificates 
    macOS
        - /Library/Application Support/Mozilla/Certificates
        - ~/Library/Application Support/Mozilla/Certificates 
    Linux
        - /usr/lib/mozilla/certificates
        - /usr/lib64/mozilla/certificates

        -------------------------------------------

Starting with version 49, Firefox can be configured to automatically search for and import CAs that have been added to the Windows certificate store by a user or administrator.

    - Type about:config in the address bar and press Enter.
    - A warning page may appear. Click Accept the Risk and Continue to go to the about:config page.
    - Search for the security.enterprise_roots.enabled preference.
    - Click the Toggle Fx71aboutconfig-ToggleButton button next to this preference to change its value to true.
    - Restart Firefox. 


    
![image](https://github.com/user-attachments/assets/349fc31e-3cb5-4314-a744-11af3e629961)

