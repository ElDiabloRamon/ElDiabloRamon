#!/bin/bash

# Ubuntu install
echo "====================================================";
echo "         Welcome to Luke's Ubuntu Install";
echo "====================================================";

# PPA 
echo "----------------------------------------------------";
snap  refresh snap-store;
echo "----------------------------------------------------";

# Adding Repo

# Timeshift Backup
sudo add-apt-repository –y ppa:teejee2008/ppa;

# ubuntu Cleaner
sudo add-apt-repository ppa:gerardpuig/ppa;

# OneShot Video Editor
sudo add-apt-repository ppa:openshot.developers/ppa;

# updating repos
sudo apt-get update;




# CLI Apps
echo "Installing CLI Apps........";
sudo apt -y install htop mc netcat screen hexedit nmon iptraf aide python3 ruby perl gcc p7zip rar gzip mlocate ncftp lynx elinks wget curl clamav ngrep vim alpine mutt snapd tlp tlp-rdw timeshift cowsay fortune-mod lolcat figlet toilet trash-cli chafa cmatrix sl net-tools lynis ntp ntpdate;


echo "----------------------------------------------------";

# Desktop Apps
#echo "Installing Desktop Apps........";

#sudo snap install bitwarden ;

#sudo apt -y install gimp inkscape blender vlc synaptic gnome-tweak-tool gufw openjdk-11-jdk gkrellm openbox obconf tint2 conky feh lightdm guake putty filezilla xcompmgr cairo-dock simplescreenrecorder openarena openshot-qt seahorse-nautilus;

#sudo dpkg-reconfigure lightdm;

echo "----------------------------------------------------";
# Update system
echo "Updating System........";
sudo apt-get upgrade;




echo "----------------------------------------------------";
# ***LAPTOPS ONLY*** Improve Battery Performance 
#sudo systemct1 enable tlp


echo "----------------------------------------------------";
# System Cleanup
sudo apt-get autoclean;
sudo apt-get autoremove;
sudo apt-get clean;


echo "----------------------------------------------------";
# Firewall Settings
sudo ufw enable;


echo "----------------------------------------------------";

# AIDE install and config
sudo echo 'Initializing AIDE......'

sudo sudo aideinit;

sudo echo 'Copying AIDE db file to default location........'

sudo cp /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz;

sudo echo 'Peforming AIDE scan of the OS........'

sudo /usr/sbin/aide --check;





echo "----------------------------------------------------";
# Install logs for manually auditing and fixing the system

sudo echo 'Creating install logs for new OS.......'

sudo mkdir /var/log/InstallLogs/;

#sudo rpm -qVa | awk '$2="c" {print $1}' > /var/log/InstallLogs/RPMVerify.txt;

sudo awk -F: '{print $1 ":" $3 ":" $7}' /etc/passwd > /var/log/InstallLogs/NonRootSysAcct.txt;

sudo awk -F: '($2 == " ") {print}' /etc/shadow > /var/log/InstallLogs/EmptyPasswd.txt;

sudo awk -F: '($2 != "x") {print}' /etc/passwd > /var/log/InstallLogs/PasswdHashes.txt;

sudo awk -F: '($3 == "0") {print}' /etc/passwd > /var/log/InstallLogs/NonRootUID0.txt;

sudo ps -eZ | egrep "initrc" | egrep -vw "tr|ps|egrep|bash|awk" |tr ':' ' ' | awk '{print $NF}' > /var/log/InstallLogs/UnConfDaemons.txt;

sudo ls -Z | grep unlabled_t > /var/log/InstallLogs/UnlabledDevs.txt;

sudo cat /proc/net/packet > /var/log/InstallLogs/Sniffer.txt;





echo "----------------------------------------------------";
# creating  default log files

sudo echo 'Initing default log files and locations......'

sudo touch /var/log/messages;

sudo touch /var/log/kern.log;

sudo touch /var/log/daemon.log;

sudo touch /var/log/unused.log;
i



echo "----------------------------------------------------";
sudo echo 'Setting secure file permitions for log files and folders.......'

sudo chown root:root  /var/log/messages;

sudo chown root:root  /var/log/kern.log;

sudo chown root:root  /var/log/daemon.log;

sudo chown root:root  /var/log/unused.log;


echo "----------------------------------------------------";
# lock down /etc
sudo echo 'Locking down the file permitions on /etc/ files.........'

sudo chown root:root /etc/passwd /etc/shadow /etc/group /etc/gshadow;

sudo chmod 644 /etc/passwd /etc/group;

sudo chmod 400 /etc/shadow /etc/gshadow;




echo "----------------------------------------------------";
# Disableing Xtra services 
sudo echo 'Disabling extra services in Ubuntu.......'
# List all services
# systemctl list-units --type=service


# SERVER
sudo systemctl status avahi-daemon.service;

sudo systemctl disable avahi-daemon.service;

sudo systemctl status avahi-daemon.service;
#....

sudo systemctl status cups.service;

sudo systemctl disable cups.service;

sudo systemctl status cups.service;
#...

sudo systemctl status cups-browsed.service;

sudo systemctl disable cups-browsed.service;

sudo systemctl status cups-browsed.service;
#...

sudo systemctl status ModemManager.service;

sudo systemctl disable ModemManager.service;

sudo systemctl status ModemManager.service;
#...

sudo systemctl status postfix@-.service;

sudo systemctl disable postfix@-.service;

sudo systemctl status postfix@-.service;
#...

# Disable this selection for desktop WiFi daemon
sudo systemctl status wpa_supplicant.service;

sudo systemctl disable wpa_supplicant.service;

sudo systemctl status wpa_supplicant.service;
##...

# Disable this selection for Desktop Audio Daemon
sudo systemctl status alsa-restore.service;

sudo systemctl disable alsa-restore.service;

sudo systemctl status alsa-restore.service;
##...

#sudo systemctl status ;

#sudo systemctl disable ;

#sudo systemctl status ;
##...

#sudo systemctl status ;

#sudo systemctl disable ;

#sudo systemctl status ;
##...



echo "----------------------------------------------------";
# ***SYSTEM BACKUPS*** Install Timeshift
#sudo timesift;



echo "----------------------------------------------------";

#sudo echo "Disable Desktop for boot up."

#sudo systemctl set-default multi-user.target   # sets it to boot to CLI mode.




echo "----------------------------------------------------";

sudo echo "Disable Cloud-init."

sudo sudo dpkg-reconfigure cloud-init;

sudo apt-get purge cloud-init;

sudo rm -rf /etc/cloud/ && sudo rm -rf /var/lib/cloud/;




echo "----------------------------------------------------";

sudo echo "Creating backup of network script."

sudo cp /etc/netplan/00-installer-config.yaml /etc/netplan/00-installer-config.yaml-BACKUP;


echo "----------------------------------------------------";

sudo echo "Configuring NTP settings."

sudo echo "Remember to remove default pool ubuntu servers after script runs. /etc/ntp.conf"

sudo bash -c "echo server 192.168.0.50 prefer iburst >> /etc/ntp.conf";

sudo systemctl restart ntp;

sudo timedatectl set-ntp off;


echo "----------------------------------------------------";


echo "====================================================";
echo "                END OF SCRIPT
echo "====================================================";







