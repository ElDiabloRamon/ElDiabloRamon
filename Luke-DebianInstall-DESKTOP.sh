#!/bin/bash

# Ubuntu install
echo "====================================================";
echo "         Welcome to Luke's Debian Install";
echo "====================================================";


# Adding Repo



# updating repos
sudo apt-get update;




# CLI Apps
echo "Installing CLI Apps........";
sudo apt -y install htop mc netcat-openbsd screen hexedit nmon iptraf aide python3 gcc p7zip gzip mlocate ncftp lynx elinks wget curl clamav ngrep vim alpine mutt tlp tlp-rdw cowsay fortune-mod lolcat figlet toilet trash-cli chafa cmatrix sl ntp ntpdate btop tmux neofetch ranger lsd hollywood net-tools lynis tldr hping3 ptunnel masscan whatweb tshark;







echo "----------------------------------------------------";
# Update system
echo "Updating System........";
sudo apt-get upgrade;




echo "----------------------------------------------------";
# ***LAPTOPS ONLY*** Improve Battery Performance 
sudo systemct1 enable tlp


echo "----------------------------------------------------";
# System Cleanup
sudo apt-get autoclean;
sudo apt-get autoremove;
sudo apt-get clean;




echo "----------------------------------------------------";

# AIDE install and config
sudo echo 'Initializing AIDE......'

sudo /usr/sbin/aide --init;

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







echo "====================================================";
echo "                END OF SCRIPT
echo "====================================================";







