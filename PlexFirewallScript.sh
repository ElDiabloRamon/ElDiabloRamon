#!/bin/bash

echo "Updateing firewall ports for PLEX";
sudo ufw accept 32400/tcp;
sudo ufw accept 32469/tcp;
sudo ufw accept 8324/tcp;
sudo ufw accept 3005/tcp;
sudo ufw accept 80/tcp;
sudo ufw accept 32412/udp;
sudo ufw accept 32413/udp;
sudo ufw accept 32414/udp;
sudo ufw accept 32410/udp;
sudo ufw accept 1900/udp;
sudo ufw accept 5353/udp;

