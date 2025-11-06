#!/bin/bash
# Linux File Permissions Hardening Script

echo "Starting permission hardening..."

# Harden database config
chmod 600 db_config.txt && echo "✓ Hardened db_config.txt (600)"

# Harden admin script
chmod 700 admin_script.sh && echo "✓ Hardened admin_script.sh (700)"

# Harden private data
chmod 600 private_data.txt && echo "✓ Hardened private_data.txt (600)"

# Harden shared folder
chmod 755 shared_folder && echo "✓ Hardened shared_folder (755)"

echo ""
echo "Hardening complete! Run 'ls -la' to verify."
