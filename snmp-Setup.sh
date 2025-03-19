#!/usr/bin/env bash
# https://linuxconfig.org/how-to-install-snmp-on-redhat-8

# setting up snmp install

echo '#####################################################################';
echo 'INSTALLING SNMP PACKAGES'
echo '#####################################################################';
sudo dnf install net-snmp net-snmp-utils


echo '#####################################################################';
echo 'SNMPD ENABLE SERVICE'
echo '#####################################################################';

sudo systemctl enable snmpd
sudo systemctl start snmpd
systemctl status snmpd -l


echo '#####################################################################';
echo 'COPY SNMPD.XML FILE TO DIR'
echo '#####################################################################';

cp ~/snmp-firewalld.xml /etc/firewalld/services/snmpd.xml


echo '#####################################################################';
echo 'ENABLE SNMPD THROUGH FIREWALL '
echo '#####################################################################';

firewall-cmd --zone=public --add-service snmpd --permanent

firewall-cmd --reload


echo '#####################################################################';
echo 'TEST SNMP RUN THE FOLLOWING:'
echo 'snmpwalk -v 2c -c public -O e 127.0.0.1'
echo '#####################################################################';

