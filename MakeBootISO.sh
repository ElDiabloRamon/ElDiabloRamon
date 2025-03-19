#!/usr/bin/bash
#dd if=<source> of=<target> bs=<byte size>; sync
dd if=/home/osadmin/Downloads/dd-megaraid_sas-07.707.51.00-1.el8_1.elrepo.iso of=/dev/sdb1 bs=512M; sync
