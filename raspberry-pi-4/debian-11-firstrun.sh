#!/bin/bash

set +e

CURRENT_HOSTNAME=`cat /etc/hostname | tr -d " \t\n\r"`

echo pi >/etc/hostname

sed -i "s/127.0.1.1.*$CURRENT_HOSTNAME/127.0.1.1\tpi/g" /etc/hosts

FIRSTUSER=`getent passwd 1000 | cut -d: -f1`

FIRSTUSERHOME=`getent passwd 1000 | cut -d: -f6`

echo "$FIRSTUSER:"'$5$AnOC19idos$kHuxbMsVMmtX5A87bQBMLHZPp5fXeKI9hnzsIAJUCl4' | chpasswd -e

systemctl enable ssh

cat >/etc/wpa_supplicant/wpa_supplicant.conf <<'WPAEOF'
country=CA
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
ap_scan=1

update_config=1
network={
	ssid="WiFi"
	psk=978b2af7e78b50abc129f4f937bbe69b059a79e4f8bd3d10d71f18931db8631b
}

WPAEOF

chmod 600 /etc/wpa_supplicant/wpa_supplicant.conf

rfkill unblock wifi

for filename in /var/lib/systemd/rfkill/*:wlan ; do
  echo 0 > $filename
done

rm -f /etc/xdg/autostart/piwiz.desktop

rm -f /etc/localtime

echo "America/Toronto" >/etc/timezone

dpkg-reconfigure -f noninteractive tzdata

cat >/etc/default/keyboard <<'KBEOF'
XKBMODEL="pc105"
XKBLAYOUT="ca"
XKBVARIANT="french"
XKBOPTIONS=""
KBEOF

dpkg-reconfigure -f noninteractive keyboard-configuration

rm -f /boot/firstrun.sh

sed -i 's| systemd.run.*||g' /boot/cmdline.txt

exit 0
