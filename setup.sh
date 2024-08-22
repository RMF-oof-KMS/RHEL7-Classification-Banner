#!/usr/bin/env bash

ps -elf | grep classification-banner | awk '{print $4}' | xargs -r kill -9

rm -f /etc/xdg/autostart/cyberteam-classbanner.desktop
\cp -f classification-banner.py /usr/local/sbin/
\cp -f classification-banner.conf /etc/
rm -f /etc/xdg/autostart/classification-banner.desktop
\cp -f classification-banner.service /etc/systemd/system/
\cp -f get-display.sh /usr/local/sbin/get-display.sh


systemctl daemon-reload
systemctl enable classification-banner.service --now


# Execution file is /usr/local/sbin/classification-banner.py
# Configuration file is /etc/classificaiton-banner.conf
# Service file is /etc/systemd/system/classification-banner.service
