#!/bin/sh
#systemctl status alsa-state.service;                  # loaded active running Manage Sound Card State (restore and store)
#systemctl disable alsa-state.service;
systemctl status avahi-daemon.service;               # loaded active running Avahi mDNS/DNS-SD Stack
systemctl disable avahi-daemon.service;
#systemctl status bluetooth.service;                  # loaded active running Bluetooth service
#systemctl disable bluetooth.service;
systemctl status cups.service;                     # loaded active running CUPS Printing Service
systemctl disable cups.service;   
systemctl status fprintd.service;                    #loaded failed failed  Fingerprint Authentication Daemon
systemctl disable fprintd.service; 
#systemctl status gdm.service;                        #loaded active running GNOME Display Manager
#systemctl disable gdm.service;  
systemctl status ModemManager.service;               #loaded active running Modem Manager
systemctl disable ModemManager.service;
systemctl status rhnsd.service;                     # loaded failed failed  LSB: Starts the Spacewalk Daemon
systemctl disable rhnsd.service;
#systemctl status smartd.service;                     #loaded active running Self Monitoring and Reporting Technology
#systemctl disable smartd.service;
#systemctl status wpa_supplicant.service;             # wifi daemon.
#systemctl disable wpa_supplicant.service;
systemctl disable yum-cron.service 
