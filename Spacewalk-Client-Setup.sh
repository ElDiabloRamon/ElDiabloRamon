#!/usr/bin/env bash
# Spacewalk client install 


# hashtag out any distro that is not the one you are currently on.
# if the system you are on is CentOS 7, then put a hashtag before the 
# install commands for CentOS 8, VMware-tools-EL8, ect.. if your OS is 
# commented out, remove the hashtag before the command, and comment out the previous selected install command. 


# CentOS 7
#echo 'Installing client on Centos EL7....';
#yum -y install rhn-client-tools rhn-check rhn-setup rhnsd m2crypto yum-rhn-plugin epel-release;


# CentOS 8
echo 'Installing client on Centos EL8....';
dnf -y install rhn-client-tools rhn-check rhn-setup rhnsd python3-m2crypto yum-rhn-plugin epel-release;


# Ubuntu setup
#echo 'Installing client on Centos EL7....';
#sudo apt-get update -y;
#sudo apt-get install -y apt-transport-spacewalk rhnsd;
#sudo mkdir /var/lock/subsys;
#wget http://192.168.10.51/pub/RHN-ORG-TRUSTED-SSL-CERT -O /usr/share/rhn/RHN-ORG-TRUSTED-SSL-CERT
#rhnreg_ks --serverUrl=https://YourSpacewalk.example.org/XMLRPC --sslCACert=/usr/share/rhn/RHN-ORG-TRUSTED-SSL-CERT --activationkey=1-my-debian-key

# Register client with Spacewalk Server (DO NOT COMMENT THIS OUT)
echo 'Registering client with spacewalk server....'
rhnreg_ks --serverUrl=http://192.168.10.51/XMLRPC --activationkey=1-8f6ced2addfc8d0d624ee10908404586


