```
███╗   ██╗██╗██╗   ██╗██████╗  ██████╗ 
████╗  ██║██║██║   ██║██╔══██╗██╔═══██╗
██╔██╗ ██║██║██║   ██║██████╔╝██║   ██║
██║╚██╗██║██║╚██╗ ██╔╝██╔══██╗██║   ██║
██║ ╚████║██║ ╚████╔╝ ██║  ██║╚██████╔╝
╚═╝  ╚═══╝╚═╝  ╚═══╝  ╚═╝  ╚═╝ ╚═════╝ 
```

# NIVRO Releases

Official release repository for **NIVRO**, an automated operating system deployment and unattended provisioning engine for supported VPS and cloud server environments.

This repository hosts release artifacts and bootstrap components used by the NIVRO platform during user-initiated operating system deployment workflows.

Official Developer & Inquiries: Telegram @V_X_L1  
Documentation & Releases: https://hamzavxl.github.io/NIVRO/  

---

## About This Repository

This repository contains public release artifacts used by the NIVRO deployment platform, including:

- Bootstrap loaders (setup.sh)
- Core unattended provisioning engines (reinstall.sh)
- VirtIO storage and network virtualization routines (core/)
- Static IP and gateway auto-healing components (core/)

These artifacts are executed as part of an operating system deployment workflow initiated by an authorized user using an installation command generated through the NIVRO service.

---

## How NIVRO Works

A typical deployment follows this automated lifecycle:

```text
Existing Cloud Server (KVM / Xen / Bare-Metal)
                    │
                    ▼
       Run NIVRO Bootstrap Command
                    │
                    ▼
     Validate License Key or Session Token
                    │
                    ▼
  Preserve Static Network & Gateway in RAM
                    │
                    ▼
    Inject Red Hat VirtIO Storage Drivers
                    │
                    ▼
     Reboot into Memory Installer (kexec)
                    │
                    ▼
  Unattended Operating System Image Expansion
                    │
                    ▼
 Configure Stealth RDP Port 22 / SSH Camouflage
                    │
                    ▼
         Target System Online & Ready
```

---

## Service Tiers: Free Community vs. VIP Enterprise

NIVRO enforces an automated License & Token Gate to protect high-speed bandwidth, dedicated mirrors, and enterprise virtualization assets.

### Free Community Tier
- Purpose: Evaluation and recovery of budget VPS instances.
- Pricing: 100% Free.
- Authorization: Generated via one-click temporary session token through the official platform.
- Supported Distributions:
  - Windows Server 2012 R2 Datacenter
  - Windows 8.1 Professional
  - Alpine Linux 3.21 Minimal
- Network: Automatic static IP and gateway preservation.
- Concurrency: Single-use execution token.

### VIP Enterprise Tier
- Purpose: High-performance production instances and specialized workloads.
- Pricing: Commercial Pass / CDK License.
- Authorization: Permanent License Key (CDK).
- Supported Distributions:
  - Windows 11 Enterprise LTSC
  - Windows 10 Enterprise LTSC
  - Windows Server 2025 / 2022 / 2019 Datacenter
  - Debian 12 / 11, Ubuntu 24.04 / 22.04 LTS, Rocky Linux 9, AlmaLinux 9, Arch Linux, Kali Linux
- Network: Full static IP preservation + Custom RDP Stealth Port (Port 22 SSH camouflage).
- VirtIO Acceleration: Priority injection of NetKVM and VioStor enterprise hypervisor drivers.
- Concurrency: Multi-server quotas (10 to 60+ concurrent server activations).
- Branding: Custom enterprise OEM metadata and desktop subscription badge.

---

## How to Obtain a License

Official VIP Enterprise License Keys (CDKs) can be acquired directly via:

- Telegram Lead Developer: @V_X_L1
- Supported payment methods: Binance Pay (USDT), Litecoin, Bitcoin, and direct transfers.

---

## Installation Command

NIVRO executes deployments via a single encrypted bootstrap command. All provisioning parameters (operating system image, Red Hat VirtIO driver injection, static network auto-healing, user credentials, and stealth port 22 camouflage) are securely resolved through your authorized setup key:

```bash
curl -sSL https://hamzavxl.github.io/NIVRO/setup.sh | bash -s -- <setup-key>
```

For custom manual invocation or evaluation tokens, keys can also be supplied via flags:

```bash
curl -sSL https://hamzavxl.github.io/NIVRO/setup.sh | bash -s -- --key <YOUR-SETUP-KEY>
curl -sSL https://hamzavxl.github.io/NIVRO/setup.sh | bash -s -- --token <YOUR-SESSION-TOKEN>
```

---

## Customer Responsibilities & Warning

- Server Authorization: You must own or control the target server with full root or administrative access.
- Permanent Data Deletion: Running an operating system reinstallation will repartition the target storage and permanently destroy all existing data. Always back up important files prior to execution.
- Hardware Requirements: Reinstallation requires hardware virtualization (KVM, Xen, Hyper-V, or Bare-Metal). Containerized environments (OpenVZ, LXC) are strictly unsupported.

---

## Support & Contact

- Lead Developer: Telegram @V_X_L1
- Repository: https://github.com/hamzavxl/NIVRO
- Distribution Channel: https://hamzavxl.github.io/NIVRO/
