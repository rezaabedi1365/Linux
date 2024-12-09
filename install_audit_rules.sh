#!/bin/bash

# Define the location of the audit.rules file
AUDIT_RULES_FILE="/path/to/your/audit.rules"  # Replace with the actual path to your audit.rules file

# Check if auditd is installed
if ! command -v auditctl &> /dev/null
then
    echo "auditd is not installed. Installing..."
    sudo apt-get install auditd audispd-plugins -y  # For Debian/Ubuntu
    sudo yum install audit audit-libs audispd-plugins -y  # For RHEL/CentOS
else
    echo "auditd is already installed."
fi

# Backup the existing audit.rules file
if [ -f /etc/audit/rules.d/audit.rules ]; then
    echo "Backing up existing audit.rules file..."
    sudo cp /etc/audit/rules.d/audit.rules /etc/audit/rules.d/audit.rules.bak
fi

# Copy the new audit.rules file
echo "Installing the new audit.rules file..."
sudo cp "$AUDIT_RULES_FILE" /etc/audit/rules.d/audit.rules

# Set proper permissions
echo "Setting proper permissions..."
sudo chmod 600 /etc/audit/rules.d/audit.rules

# Restart auditd to apply the new rules
echo "Restarting auditd service..."
sudo systemctl restart auditd

# Check the status of auditd
echo "Checking the status of auditd..."
sudo systemctl status auditd

echo "Audit rules installation completed."
