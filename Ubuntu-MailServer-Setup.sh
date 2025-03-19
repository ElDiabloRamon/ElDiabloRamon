#!/bin/sh
echo "======================================================";
echo "       Installing email server packages....";
echo "------------------------------------------------------";

# Installing email server packages...
sudo apt -y install postgresql dovecot-sieve dovecot-solr dovecot-antispam postfix-pgsql dovecot-lmtpd dovecot-pgsql dovecot-imapd dovecot-pop3d postfix fail2ban mutt alpine;

echo "------------------------------------------------------:;
echo "       Setting up Postgresql...."
echo "------------------------------------------------------:;

# Creating backup of config script.....
sudo cp /etc/postgresql/12/main/pg_ident.conf /etc/postgresql/12/main/pg_ident.conf-BACKUP;

sudo cp /etc/postgresql/12/main/pg_hba.conf /etc/postgresql/12/main/pg_hba.conf-BACKUP;

# piping settings to tail end of file....
sudo echo 'mailmap         dovecot                 mailreader' >> /etc/postgresql/12/main/pg_ident.conf;
sudo echo 'mailmap         postfix                 mailreader' >> /etc/postgresql/12/main/pg_ident.conf;
sudo echo 'mailmap         root                    mailreader' >> /etc/postgresql/12/main/pg_ident.conf;

sudo echo 'local       mail    all     peer map=mailmapr' >> /etc/postgresql/12/main/pg_hba.conf;

# Restarting postgresql service....
sudo systemctl restart postgresql;


echo "------------------------------------------------------:;
echo "                   DONE!";
echo "======================================================";

