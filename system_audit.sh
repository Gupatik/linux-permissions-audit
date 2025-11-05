#!/bin/bash
# Comprehensive Linux System Permission Audit
# Checks critical system files for security issues

echo "========================================="
echo "System-Wide Permission Security Audit"
echo "========================================="
echo ""

echo "[1] Checking /etc/passwd permissions..."
ls -l /etc/passwd
expected="644"
actual=$(stat -c "%a" /etc/passwd)
if [ "$actual" != "$expected" ]; then
    echo "WARNING: /etc/passwd has permissions $actual (should be 644)"
else
    echo "/etc/passwd permissions are correct"
fi
echo ""

echo "[2] Checking /etc/shadow permissions..."
ls -l /etc/shadow
expected="640"
actual=$(stat -c "%a" /etc/shadow)
if [ "$actual" -gt "$expected" ]; then
    echo "WARNING: /etc/shadow is too permissive! ($actual)"
else
    echo "/etc/shadow permissions are secure"
fi
echo ""

echo "[3] Checking for SUID/SGID files (potential privilege escalation)..."
echo "Scanning common directories..."
find /usr/bin /usr/sbin /bin /sbin -type f \( -perm -4000 -o -perm -2000 \) -ls 2>/dev/null | head -10
echo ""

echo "[4] Checking home directory permissions..."
ls -ld /home/*
echo ""

echo "[5] Checking for world-writable files in /tmp..."
find /tmp -type f -perm -002 -ls 2>/dev/null | head -5
echo ""

echo "[6] Checking sudoers file..."
ls -l /etc/sudoers 2>/dev/null || echo "No direct access to sudoers (normal)"
echo ""

echo "System audit complete!"
echo "Review warnings above and apply hardening as needed."
