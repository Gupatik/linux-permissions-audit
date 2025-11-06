#!/bin/bash
# Linux File Permissions Security Audit Script

echo "==================================="
echo "Linux File Permissions Audit Tool"
echo "==================================="
echo ""

# Check for world-writable files
echo "[!] Checking for world-writable files (777)..."
find . -type f -perm -002 -ls 2>/dev/null

echo ""
echo "[!] Checking for world-readable sensitive files..."
for file in *config* *password* *secret* *private*; do
    if [ -f "$file" ]; then
        perms=$(stat -c "%a" "$file" 2>/dev/null)
        echo "File: $file - Permissions: $perms"
    fi
done

echo ""
echo "[!] Checking for world-writable directories..."
find . -type d -perm -002 -ls 2>/dev/null

echo ""
echo "Audit complete!"
