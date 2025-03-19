!#/bin/sh

sudo echo "RHEL 7 NSA INSTALL AUTOMATION SCRIPT:"

# By Luke Galutia

##########################################################

# Create Gold Standard Template from script

# For CENTOS 7 / RHEL 7 ONLY

#-----------------------------------------------
sudo echo "###############################################################"

sudo echo 'Installing 3rd party repos for RHEL / CENTOS / SLES......'


#sudo systemctl set-default multi-user.target



sudo dnf -y install epel-release;

sudo dnf -y repolist epel -v 





sudo echo "###############################################################"


# Installing cli programs which will enhance the cli mode.

echo 'Installing some enhancement cli packages.......'

#


sudo dnf -y install htop lynx elinks traceroute dstat pv mc iptraf hexedit p7zip ngrep nmon ncftp mutt alpine screen aide googler cowsay banner;

sudo dnf -y check-update; sudo dnf -y update;

#dnf -y install wikit  browsh lolcat boxes figlet toilet trash-cli nms chafa cmatrix

# AIDE install and config
sudo echo "###############################################################"
sudo echo 'Initializing AIDE......'

sudo /usr/sbin/aide --init;

sudo echo 'Copying AIDE db file to default location........'

sudo cp /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz;

sudo echo 'Peforming AIDE scan of the OS........'

sudo /usr/sbin/aide --check;




# Install logs for manually auditing and fixing the system
sudo echo "###############################################################"

sudo echo 'Creating install logs for new OS.......'

sudo mkdir /var/log/InstallLogs/;

sudo rpm -qVa | awk '$2="c" {print $1}' > /var/log/InstallLogs/RPMVerify.txt;

sudo awk -F: '{print $1 ":" $3 ":" $7}' /etc/passwd > /var/log/InstallLogs/NonRootSysAcct.txt;

sudo awk -F: '($2 == " ") {print}' /etc/shadow > /var/log/InstallLogs/EmptyPasswd.txt;

sudo awk -F: '($2 != "x") {print}' /etc/passwd > /var/log/InstallLogs/PasswdHashes.txt;

sudo awk -F: '($3 == "0") {print}' /etc/passwd > /var/log/InstallLogs/NonRootUID0.txt;

sudo ps -eZ | egrep "initrc" | egrep -vw "tr|ps|egrep|bash|awk" |tr ':' ' ' | awk '{print $NF}' > /var/log/InstallLogs/UnConfDaemons.txt;

sudo ls -Z | grep unlabled_t > /var/log/InstallLogs/UnlabledDevs.txt;

sudo cat /proc/net/packet > /var/log/InstallLogs/Sniffer.txt;


# creating  default log files
sudo echo "###############################################################"

sudo echo 'Initing default log files and locations......'

sudo touch /var/log/messages;

sudo touch /var/log/kern.log;

sudo touch /var/log/daemon.log;

sudo touch /var/log/unused.log;

sudo echo "###############################################################"

sudo echo 'Setting secure file permitions for log files and folders.......'

sudo chown root:root  /var/log/messages;

sudo chown root:root  /var/log/kern.log;

sudo chown root:root  /var/log/daemon.log;

sudo chown root:root  /var/log/unused.log;


# lock down /etc

sudo echo "###############################################################"

sudo echo 'Locking down the file permitions on /etc/ files.........'

sudo chown root:root /etc/passwd /etc/shadow /etc/group /etc/gshadow;

sudo chmod 644 /etc/passwd /etc/group;

sudo chmod 400 /etc/shadow /etc/gshadow;


# Disableing Xtra services 

sudo echo "###############################################################"

sudo echo 'Disabling extra services in CENTOS / REHL / Fedora.......'




sudo systemctl status rpcidmapd.service;

sudo systemctl status rhnsd.service;

sudo systemctl disable rhnsd.service;

sudo systemctl status rhnsd.service;

sudo systemctl status yum-updatesd.service;

sudo systemctl disable yum-updatesd.service;

sudo systemctl status yum-updatesd.service;

sudo systemctl disable firstboot.service;

sudo systemctl status firstboot.service;

sudo systemctl status hplip.service;

sudo systemctl disable hplip.service;

sudo systemctl status hplip.service;

sudo systemctl status isdn.service;

sudo systemctl disable isdn.service;

sudo systemctl status isdn.service;

sudo systemctl status kdump.service;

sudo systemctl disable kdump.service;

sudo systemctl status kdump.service;

sudo systemctl status kudzu.service;

sudo systemctl disable kudzu.service;

sudo systemctl status kudzu.service;

sudo systemctl status mcstrans.service;

sudo systemctl disable mcstrans.service;

sudo systemctl status mcstrans.service;

sudo systemctl status sendmail.service;

sudo systemctl disable sendmail.service;

sudo systemctl status sendmail.service;

sudo systemctl status setroubleshoot.service;

sudo systemctl disable setroubleshoot.service;

sudo systemctl status setroubleshoot.service;

sudo systemctl status yum-updatesd.service;

sudo systemctl disable yum-updatesd.service;

sudo systemctl status yum-updatesd.service;

sudo systemctl status syslog.service;

sudo systemctl disable syslog.service;

sudo systemctl status syslog.service;

sudo systemctl status avahi-daemon.service;               # loaded active running Avahi mDNS/DNS-SD Stack

sudo systemctl disable avahi-daemon.service;

sudo systemctl status yum-cron.service 

sudo systemctl disable yum-cron.service 

sudo echo "###############################################################"





sudo echo "###############################################################"

sudo echo "Disable Desktop for boot up."

#sudo systemctl set-default multi-user.target   # sets it to boot to CLI mode.


sudo echo "###############################################################"

sudo echo 'DONE!'



