<div align="center">
  <img src="https://hamzavxl.github.io/NIVRO/icon.svg" width="72" height="72" alt="NIVRO Logo" />
  <h1>NIVRO — Automated Cloud OS Provisioner</h1>
  <p><b>Unattended Operating System Reinstallation &amp; Cryptographic Provisioning Engine for KVM &amp; Bare-Metal Servers</b></p>
  <p>
    <a href="https://hamzavxl.github.io/NIVRO/">Official Release Portal</a> &middot;
    <a href="https://t.me/V_X_L1">Telegram @V_X_L1</a> &middot;
    <a href="#installation-command">Signed Execution</a>
  </p>
</div>

---

## About This Repository

This repository hosts the official bootstrapper (`reinstall.sh`) for **NIVRO**, an automated operating system deployment engine designed for KVM, Xen, Hyper-V, and Bare-Metal cloud servers:

- **Core Unattended Engine (`reinstall.sh`)**: In-memory kexec bootstrapper for zero-intervention OS reinstallation.
- **VirtIO Hypervisor Acceleration**: Automated injection of Red Hat `viostor` and `NetKVM` drivers for Windows Server and LTSC editions.
- **Network Auto-Healing**: Preserves static IPv4 addresses, subnet masks, and default gateways across OS families.
- **Real-Time Telemetry Pipeline**: Reports live installation progress (`25% -> 50% -> 75% -> 100%`) directly back to the NIVRO console.

Provisioning is executed exclusively via cryptographically signed payload hashes (`HMAC-SHA256`) issued through the official NIVRO platform.

---

## How NIVRO Works

A typical deployment follows this automated lifecycle:

```text
Existing Cloud Server (KVM / Xen / Bare-Metal)
                    │
                    ▼
   Execute Signed NIVRO Payload (--payload)
                    │
                    ▼
   Verify HMAC-SHA256 Cryptographic Signature
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

## Service Tiers

NIVRO enforces a cryptographic License & Payload Gate to protect high-speed mirrors and enterprise virtualization assets.

### 1. Free Community Tier ($0)
- **Purpose**: Evaluation and recovery of budget VPS instances.
- **Authorization**: One-click signed evaluation payload generated via the official platform.
- **Supported Distributions**:
  - Windows Server 2012 R2 Datacenter
  - Windows 8.1 Professional
  - Alpine Linux 3.21 Minimal
- **Network**: Automatic static IPv4 and gateway preservation.

### 2. NIVRO Standard Pass ($0.20 / install · $2.50 Bundle)
- **Purpose**: Production Linux and Windows deployments with custom credentials.
- **Supported Distributions**: All 20 Windows (Windows 11 LTSC, Server 2025/2022/2019) and Linux (Ubuntu 24.04, Debian 12, Rocky 9, AlmaLinux 9, Arch, Kali) templates.
- **Customization**: Custom Administrator / root password and username.
- **Drivers**: Full VirtIO storage and network driver injection.

### 3. NIVRO Private Pass ($0.30 / install · $3.50 Bundle)
- **Purpose**: Hardened enterprise workloads requiring stealth access and full customization.
- **Supported Distributions**: All 20 Windows & Linux templates + priority mirror pipelines.
- **Stealth Port Camouflage**: Custom RDP / SSH port binding (including Port 22 SSH camouflage for Windows RDP).
- **Telemetry & Quotas**: Real-time VPS status callbacks and multi-server concurrent activations.

---

## How to Obtain a License

Official NIVRO Standard and Private License Keys (CDKs) can be acquired via the platform or directly through:

- **Telegram Lead Developer**: [@V_X_L1](https://t.me/V_X_L1)
- **Supported Payment Methods**: Binance Pay (USDT), Litecoin, Bitcoin, and instant automated checkout.

---

## Installation Command
 
NIVRO executes deployments exclusively through cryptographically signed and encrypted execution payloads. All provisioning parameters (target operating system image, VirtIO drivers, static network preservation, credentials, and stealth port configuration) are sealed and signed with HMAC SHA-256 to prevent parameter tampering and credential exposure:
 
```bash
curl -sSL https://hamzavxl.github.io/NIVRO/reinstall.sh | bash -s -- --payload <SIGNED-PAYLOAD-HASH>
```

> **Security Policy**: Manual parameter flags (`--password`, `--key`, etc.) are strictly disabled in production. All deployment commands are issued exclusively through the official web console to prevent unauthorized tampering and credential exposure.

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
