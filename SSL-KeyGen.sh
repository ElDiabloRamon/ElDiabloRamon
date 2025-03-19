#!/bin/sh

sudo openssl req -newkey rsa:4096 -x509 -sha512 -days 99999 -nodes -out /etc/postfix/ssl/mail.hive32.com.crt -keyout /etc/postfix/ssl/mail.hive32.com.key;

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt;

sudo sudo certbot certonly -a apache --agree-tos --no-eff-email --staple-ocsp --email postmaster@hive32.com -d mail.hive32.com


/etc/dovecot/dovecot.conf line 26: Unknown setting: smtp_tls_CApath
/etc/dovecot/dovecot.conf line 30: Unknown setting: <pre><code>service

/etc/dovecot/conf.d/10-ssl.conf line 14: ssl_cert: Can't open file /etc/ssl/cert>
/etc/ssl/cert/mail.hive32.net.crt: No such file or directory

