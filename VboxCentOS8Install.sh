#!/usr/bin/bash

sudo dnf -y config-manager --add-repo=https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo;

rpm --import https://www.virtualbox.org/download/oracle_vbox.asc;

sudo dnf -y install binutils kernel-devel kernel-headers libgomp make patch gcc glibc-headers glibc-devel dkms;

sudo dnf -y search virtualbox;

sudo dnf -y install VirtualBox;

usermod -aG vboxusers osadmin;

