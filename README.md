# Linux File Permissions Security Audit Project

**Course:** CyberSecurity - Embedded Systems & IoT  
**Institution:** Université Ibn Zohr - Faculté des Sciences d'Agadir  
**Academic Year:** 2025/2026  

## Project Overview
This project demonstrates the security risks of misconfigured file permissions in Linux systems and provides a comprehensive hardening methodology based on the principle of least privilege.

## Environment
- **Operating System:** Ubuntu 22.04 LTS on WSL2
- **Tools Used:** Linux CLI (chmod, chown, ls, stat, find)
- **Test Users:** Primary user + simulated attacker account

## Project Structure
```
linux_permissions_audit/
├── README.md                    # This file
├── audit_permissions.sh         # Local directory audit script
├── system_audit.sh              # System-wide security audit
├── harden_permissions.sh        # Automated hardening script
├── before_permissions.txt       # Pre-hardening state
├── after_permissions.txt        # Post-hardening state
├── findings_summary.txt         # Detailed findings report
└── test_files/                  # Sample vulnerable files
    ├── db_config.txt
    ├── admin_script.sh
    ├── private_data.txt
    └── shared_folder/
```

## Vulnerabilities Identified
1. **World-readable credentials** (777 permissions on sensitive files)
2. **World-writable scripts** (potential for malicious modification)
3. **Overpermissive directories** (unauthorized file creation risk)

## Hardening Steps
1. Audit current permissions using `ls -la` and custom scripts
2. Identify overpermissive files (777, 666, 644 on sensitive data)
3. Apply principle of least privilege
4. Verify with unauthorized user testing

## Usage

### Run Audit
```bash
./audit_permissions.sh
./system_audit.sh
```

### Apply Hardening
```bash
./harden_permissions.sh
```

### Verify Security
```bash
su - attacker
cat /home/user/linux_permissions_audit/db_config.txt  # Should fail
```

## Key Findings
- **Before:** 4 critical vulnerabilities with world-readable/writable permissions
- **After:** All files properly secured with restrictive permissions
- **Verification:** Unauthorized access attempts successfully blocked

## References
- Linux man pages (chmod, chown, stat)
- NIST Guidelines for System Hardening
- CIS Ubuntu Linux Benchmark

## Authors
SEBBAR Mohamed, SAGGO Younes, MAICHINI Hajar, SARMA FatimZahra
