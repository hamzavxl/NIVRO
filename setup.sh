#!/usr/bin/env bash
# ==============================================================================
# NIVRO Automated Deployment Engine — Bootstrap Loader
# CDN Endpoint:    https://hamzavxl.github.io/NIVRO/
# Developer:       NIVRO Core Engineering Team
# ==============================================================================

export LANG=C
set -o pipefail

if [ -z "$BASH" ]; then
    bash "$0" "$@"
    exit 0
fi

if [ "$(id -u)" != "0" ]; then
    echo "[!] ERROR: Root or Administrator privileges required to run NIVRO."
    exit 1
fi

# Detect container virtualization (Requires KVM / Xen / Bare-metal)
if command -v systemd-detect-virt >/dev/null 2>&1; then
    VIRT_TYPE=$(systemd-detect-virt 2>/dev/null)
    if [ "$VIRT_TYPE" = "openvz" ] || [ "$VIRT_TYPE" = "lxc" ]; then
        echo "[!] CRITICAL: Container virtualization ($VIRT_TYPE) detected."
        echo "[!] Operating system reinstallation requires KVM, Xen, or Dedicated Bare-Metal hardware."
        exit 1
    fi
fi

# ==============================================================================
# NIVRO LICENSE & TOKEN GATE
# ==============================================================================
HAS_AUTH=0
PASS_ARGS=("$@")

# If single argument passed without leading hyphen or starts with NVRO_
if [ $# -eq 1 ]; then
    if [[ "$1" == NVRO_* ]]; then
        HAS_AUTH=1
        PASS_ARGS=(--payload "$1")
    elif [[ "$1" != -* ]]; then
        HAS_AUTH=1
        PASS_ARGS=(--key "$1")
    fi
fi

for ARG in "$@"; do
    if [ "$ARG" = "--key" ] || [ "$ARG" = "--token" ] || [ "$ARG" = "--payload" ] || [ "$ARG" = "--hash" ] || [[ "$ARG" == NVRO_* ]]; then
        HAS_AUTH=1
        break
    fi
done

if [ -n "$NIVRO_KEY" ] || [ -n "$NIVRO_TOKEN" ] || [ -n "$NIVRO_PAYLOAD" ]; then
    HAS_AUTH=1
fi

if [ "$HAS_AUTH" -eq 0 ]; then
    echo "============================================================================="
    echo "          _   _ _____ _    _ _____   ____  "
    echo "         | \ | |_   _| |  | |  __ \ / __ \ "
    echo "         |  \| | | | | |  | | |__) | |  | |"
    echo "         | . \` | | | | |  | |  _  /| |  | |"
    echo "         | |\  |_| |_ \ \/ /| | \ \| |__| |"
    echo "         |_| \_|_____| \__/ |_|  \_\\____/ "
    echo "                                           "
    echo "  NIVRO AUTOMATED CLOUD OS PROVISIONING PLATFORM"
    echo "============================================================================="
    echo "[!] ERROR: Unauthorized execution."
    echo "[!] A valid NIVRO License Key (CDK) or Website Token is strictly required."
    echo ""
    echo "[*] FREE COMMUNITY EVALUATION:"
    echo "    Generate a 1-click free installation command through our official platform."
    echo "    - Allowed Free Distros: Windows Server 2012 R2, Windows 8.1 Pro, Alpine Linux"
    echo ""
    echo "[*] VIP ENTERPRISE LICENSE (CDK):"
    echo "    Purchase high-speed licenses (Windows 11 LTSC, Server 2025, Stealth Port 22):"
    echo "    => Official Platform: https://hamzavxl.github.io/NIVRO/"
    echo ""
    echo "Usage Examples:"
    echo "    bash setup.sh <setup-key>"
    echo "    bash setup.sh --key <YOUR-SETUP-KEY>"
    echo "    bash setup.sh --token <YOUR-SESSION-TOKEN>"
    echo "============================================================================="
    exit 1
fi

echo "[*] Fetching verified NIVRO Deployment Engine from CDN..."
INSTALLER_URL="https://hamzavxl.github.io/NIVRO/reinstall.sh"
TARGET_FILE="/tmp/reinstall.sh"

if ! curl -sSL "$INSTALLER_URL" -o "$TARGET_FILE"; then
    if ! wget -qO "$TARGET_FILE" "$INSTALLER_URL"; then
        echo "[!] ERROR: Failed to download deployment components from CDN."
        exit 1
    fi
fi

chmod +x "$TARGET_FILE"
exec bash "$TARGET_FILE" "${PASS_ARGS[@]}"
