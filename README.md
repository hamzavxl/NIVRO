<div align="center">
  <img src="https://hamzavxl.github.io/NIVRO/icon.svg" width="52" height="52" alt="NIVRO" />
  <h1>NIVRO</h1>
  <p><b>Unattended Operating System Provisioning &amp; Reinstallation Engine for KVM &amp; Bare-Metal Servers</b></p>
</div>

---

## Overview

**NIVRO** (`reinstall.sh`) is an automated operating system bootstrapper designed to reinstall existing Linux and Windows cloud servers into clean, minimal operating systems without manual VNC intervention or external rescue media.

- **In-Memory Execution (`kexec`)**: Boots directly into a temporary RAM-based installer environment from the running OS.
- **Network Auto-Preservation**: Automatically detects and preserves active static IPv4 addresses, subnet masks, and default gateways across reboots.
- **VirtIO Storage &amp; Network Injection**: Pre-integrates Red Hat `viostor` and `NetKVM` paravirtualized drivers for Windows Server and LTSC editions.
- **Signed Payload Execution**: Accepts pre-configured, integrity-verified deployment payloads containing target OS and partition parameters.

---

## Installation

Execute the bootstrapper on a supported root shell using a generated deployment payload:

```bash
curl -sSL https://hamzavxl.github.io/NIVRO/reinstall.sh | bash -s -- --payload <PAYLOAD-HASH>
```

> **Note**: Direct manual CLI flags (`--password`, `--key`, `--image-name`) are disabled. All configuration parameters are passed exclusively via the verified `--payload` hash.

---

## Provisioning Workflow

```text
Target Server (KVM / Xen / Hyper-V / Bare-Metal)
                      │
                      ▼
       Execute Bootstrapper (--payload)
                      │
                      ▼
     Verify Payload Signature & Integrity
                      │
                      ▼
     Capture Active IPv4 & Gateway Config
                      │
                      ▼
      Load In-Memory Installer (kexec)
                      │
                      ▼
   Repartition Disk & Write Target OS Image
                      │
                      ▼
         Reboot into Clean System
```

---

## Supported Distributions

| Family | Supported Editions | Min RAM | Min Disk |
| :--- | :--- | :--- | :--- |
| **Windows** | Windows 11 Enterprise LTSC, Windows 10 Enterprise LTSC, Windows Server 2025 / 2022 / 2019 / 2016 / 2012 R2, Windows 8.1 Pro | 1 GB – 2 GB | 10 GB – 16 GB |
| **Linux** | Ubuntu 24.04 / 22.04 LTS, Debian 12 / 11, Alpine Linux 3.21, Rocky Linux 9, AlmaLinux 9, Fedora 41, Arch Linux, Kali Linux, openEuler | 128 MB – 1.5 GB | 1 GB – 12 GB |

---

## System Requirements &amp; Warnings

- **Root Privileges**: Must be executed as `root` (or Administrator) on the target host.
- **Hardware Virtualization**: Requires full hardware virtualization (**KVM, Xen, Hyper-V, VMware, or Bare-Metal**). Containerized virtualization (**OpenVZ / LXC**) is not supported.
- **Data Destruction Warning**: Reinstalling the operating system repartitions the primary storage device and permanently erases all existing data. Back up critical files before running the installer.

---

## License

Released under the [GNU General Public License v3.0](LICENSE).
