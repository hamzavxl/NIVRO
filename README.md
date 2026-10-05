<div align="center">

```
███╗   ██╗██╗██╗   ██╗██████╗  ██████╗ 
████╗  ██║██║██║   ██║██╔══██╗██╔═══██╗
██╔██╗ ██║██║██║   ██║██████╔╝██║   ██║
██║╚██╗██║██║╚██╗ ██╔╝██╔══██╗██║   ██║
██║ ╚████║██║ ╚████╔╝ ██║  ██║╚██████╔╝
╚═╝  ╚═══╝╚═╝  ╚═══╝  ╚═╝  ╚═╝ ╚═════╝ 
```

### Next-Generation Unattended Cloud Operating System Provisioner
**Automated Bare-Metal & KVM Reinstallation Engine with Network Auto-Healing & VirtIO Acceleration**

[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20Windows-blue?style=for-the-badge&logo=linux)](https://nivro.top)
[![License Gate](https://img.shields.io/badge/License%20Gate-Enforced-success?style=for-the-badge&logo=shield)](https://nivro.top)
[![Telegram](https://img.shields.io/badge/Telegram-@V__X__L1-2CA5E0?style=for-the-badge&logo=telegram)](https://t.me/V_X_L1)
[![CDN](https://img.shields.io/badge/CDN-GitHub%20Pages%20Fastly-orange?style=for-the-badge&logo=fastly)](https://hamzavxl.github.io/NIVRO/)

[Official Web Portal](https://nivro.top) • [Purchase License](https://t.me/V_X_L1) • [Telegram Developer](https://t.me/V_X_L1) • [Documentation](https://hamzavxl.github.io/NIVRO/)

</div>

---

## 📌 About NIVRO

**NIVRO** is an enterprise-grade automated operating system deployment and reinstallation engine engineered specifically for cloud VPS and bare-metal environments (KVM, Xen, Hyper-V, and Dedicated Servers).

It allows system administrators, engineers, and power users to remotely reinstall any server from Linux to Windows, Windows to Linux, or between Linux distributions in minutes without accessing a provider VNC console or mounting manual ISOs.

### ⚡ Technical Guarantees
- 🌐 **Network Auto-Healing:** Automatically maps and preserves static IPv4/IPv6 addresses, subnet masks, gateways, and DNS resolvers in volatile memory before disk repartitioning.
- 🚀 **VirtIO Driver Injection:** Injects official Red Hat VirtIO storage (`viostor`), network (`netkvm`), and balloon drivers on-the-fly, ensuring 100% disk and NIC detection on budget cloud providers (Hetzner, OVH, Contabo, DigitalOcean, Linode).
- 🔒 **Stealth Port 22 Camouflage:** Automatically configures Windows RDP to listen on Port 22 with SSH emulation banners to bypass strict ISP and corporate cloud firewall blocks.
- ⚡ **Global CDN Edge:** Release artifacts and bootstrapper scripts are distributed globally via high-speed edge caching (`hamzavxl.github.io/NIVRO`).

---

## 🛡️ Licensing Model (Free Community vs. VIP Enterprise)

To protect infrastructure performance, bandwidth, and high-speed mirrors, **NIVRO enforces a License & Token Gate**. The script cannot be executed without an authorized **License Key (CDK)** or an active **Free Session Token** generated from our official platform.

| Feature / Capability | Free Community Tier | VIP Enterprise Tier (CDK) |
| :--- | :---: | :---: |
| **Pricing** | **100% Free** | **Paid / Commercial Pass** |
| **Access Method** | Generate 1-Click Token at [nivro.top](https://nivro.top) | Purchase CDK License from [@V_X_L1](https://t.me/V_X_L1) |
| **Supported Windows** | Windows Server 2012 R2, Windows 8.1 Pro | Windows 11 Enterprise LTSC, Windows 10 LTSC, Windows Server 2025/2022/2019 |
| **Supported Linux** | Alpine Linux 3.21 | Debian 12/11, Ubuntu 24/22, Rocky 9, Alma 9, Arch, Kali |
| **Network Auto-Healing** | ✅ Yes | ✅ Yes |
| **VirtIO Driver Injection** | ✅ Yes | ✅ Yes |
| **Custom Stealth Port (Port 22)** | ❌ Fixed | ✅ Fully Customizable |
| **Multi-Server Concurrency** | Single execution | 10 to 60+ Server Slots |
| **Custom OEM Branding** | NIVRO Community | Personalized Enterprise Watermark |
| **Download Speed** | Standard | High-Speed Priority CDN |

---

## 🛒 How to Purchase & Obtain a License

You can acquire official NIVRO VIP License Keys (CDKs) through two official channels:

1. **Direct Purchase via Developer (Fast Support & Bulk Discounts):**
   - 💬 **Telegram:** **[@V_X_L1](https://t.me/V_X_L1)** (Lead Developer)
   - Available payment options: Binance Pay (USDT / LTC / BTC), Cryptocurrencies, Direct transfer.
2. **Official Web Portal (Automated Instant Delivery):**
   - 🌐 **Web:** **[https://nivro.top](https://nivro.top)**
   - Instant automated checkout with Binance Pay and real-time CDK activation.

---

## 🚀 Deployment Instructions

### Option 1: Free Community Deployment (100% Free)
1. Visit our official portal: **[https://nivro.top](https://nivro.top)**
2. Select your desired free evaluation distribution (*Windows Server 2012 R2*, *Windows 8.1 Pro*, or *Alpine Linux*).
3. Copy your unique, 1-click execution command with an embedded session token:
   ```bash
   curl -sSL https://hamzavxl.github.io/NIVRO/reinstall.sh | bash -s -- <os> --token <YOUR_FREE_TOKEN>
   ```

### Option 2: VIP Enterprise Deployment (Licensed CDK)
Run the bootstrapper directly on your VPS terminal with your authorized `--key`:

#### Reinstalling to Windows (Windows 11 LTSC / Server 2025 / 2022):
```bash
curl -sSL https://hamzavxl.github.io/NIVRO/reinstall.sh | bash -s -- windows \
  --image-name "Windows 11 Enterprise LTSC" \
  --password "YourSecurePassword123!" \
  --rdp-port 22 \
  --key "NIVRO-XXXX-XXXX-XXXX-XXXX"
```

#### Reinstalling to Linux (Debian 12 / Ubuntu 24.04 / Rocky 9):
```bash
curl -sSL https://hamzavxl.github.io/NIVRO/reinstall.sh | bash -s -- debian 12 \
  --password "YourSecurePassword123!" \
  --key "NIVRO-XXXX-XXXX-XXXX-XXXX"
```

> [!NOTE]
> If neither `--key` nor `--token` is provided, the script will halt immediately with an unauthorized error. Please ensure you generate your pass or token from [https://nivro.top](https://nivro.top).

---

## 👨‍💻 Official Developer & Support

- **Lead Core Developer:** **[@V_X_L1](https://t.me/V_X_L1)** (Telegram)
- **Official Repository:** [https://github.com/hamzavxl/NIVRO](https://github.com/hamzavxl/NIVRO)
- **CDN Mirror:** [https://hamzavxl.github.io/NIVRO/](https://hamzavxl.github.io/NIVRO/)
- **Service Portal:** [https://nivro.top](https://nivro.top)

---

<div align="center">
  <small>© 2026 NIVRO Cloud Infrastructure. All rights reserved. Developed & maintained by @V_X_L1.</small>
</div>
