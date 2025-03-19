#!/usr/bin/env python3
# program that converts host name to IP Address
# By: Luke Galutia

import socket, sys

host_name = socket.gethostname(sys.argv[1])
host_ip = socket.gethostbyname(host_name)
print(host_ip)