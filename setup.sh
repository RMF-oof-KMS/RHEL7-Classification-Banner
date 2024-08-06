#!/usr/bin/env bash

ps -elf | grep classification-banner | awk '{print $4}' | xargs -r kill -9

rm -f /etc/xdg/autostart/cyberteam-classbanner.desktop
rm -f /usr/local/sbin/classification-banner.py
\cp classification-banner.py /usr/local/sbin/
rm -f /etc/classification_banner.conf
\cp classification-banner.conf /etc/
rm -f /etc/xdg/autostart/classification-banner.desktop
\cp classification-banner.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable classification-banner.service --now


# Execution file is /usr/local/sbin/classification-banner.py
# Configuration file is /etc/classificaiton-banner.conf
# Initiation file is /etc/xdg/autostart/classification-banner.desktop