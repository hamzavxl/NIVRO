# NIVRO Unattended Cloud Provisioner

Automated, unattended operating system reinstallation engine for KVM and VPS cloud servers.

## Features
- **Network Auto-Healing**: Preserves static IPv4 address, gateway, subnet mask, and DNS resolvers in RAM before disk formatting.
- **Red Hat VirtIO Drivers**: Injects official NetKVM, VioStor, and balloon drivers for immediate disk recognition on budget hypervisors.
- **Multi-OS Support**:
  - Windows: Windows 11 IoT Enterprise LTSC, Windows 10 LTSC, Windows Server 2025/2022/2019/2016/2012 R2, Windows 8.1 Pro.
  - Linux: Debian, Ubuntu, Alpine Linux, Arch Linux, Rocky Linux, AlmaLinux, Kali.
- **Stealth Camouflage**: Default stealth port 22 with SSH emulation to bypass cloud firewall and ISP scanning blocks.
- **Zero Manual ISO Mounting**: Operates directly in volatile memory via live PXE/kexec bootstrap.

## Installation Usage

```bash
# Automated reinstallation triggered via NIVRO platform
bash reinstall.sh <distro> [options]
```
