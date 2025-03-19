#!/bin/sh

systemctl status pve-daily-update.timer;
systemctl stop pve-daily-update.timer;
systemctl disable pve-daily-update.timer;
systemctl status pve-daily-update.timer;
