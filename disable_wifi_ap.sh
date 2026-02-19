#!/bin/bash
#===============================================================================
# Disable WiFi Access Point
# Stops and disables hostapd + dnsmasq without affecting Ravidian or tunnel
#===============================================================================

set -e

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root: sudo ./disable_wifi_ap.sh"
    exit 1
fi

echo "Stopping WiFi AP services..."
systemctl stop hostapd 2>/dev/null || true
systemctl stop dnsmasq 2>/dev/null || true

echo "Disabling WiFi AP services from boot..."
systemctl disable hostapd 2>/dev/null || true
systemctl disable dnsmasq 2>/dev/null || true

echo "Removing wlan0 static IP config..."
sed -i '/^# Ravidian WiFi/,/^$/d' /etc/dhcpcd.conf 2>/dev/null || true
sed -i '/^interface wlan0/,/^$/d' /etc/dhcpcd.conf 2>/dev/null || true

echo ""
echo "Done. WiFi AP is disabled."


