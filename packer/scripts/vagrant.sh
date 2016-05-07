#!/bin/bash

set -eu

useradd -m -s /bin/bash vagrant

for user in vagrant
do
	# Set up sudo
	echo %$user ALL=NOPASSWD:ALL > /etc/sudoers.d/$user
	chmod 0440 /etc/sudoers.d/$user

	# Setup sudo to allow no-password sudo for "sudo"
	usermod -a -G sudo $user

	# Installing ubuntu keys
	mkdir -p /home/$user/.ssh
	chmod 700 /home/$user/.ssh
	cd /home/$user/.ssh
	wget --quiet --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys

	chmod 600 /home/$user/.ssh/authorized_keys
	chown -R $user /home/$user/.ssh
done

# Install NFS for ubuntu
apt-get -yqq install nfs-common

# Set up .bashrc
cat << EOF >> /home/vagrant/.bashrc

if [ -f /vagrant/.bashrc ]; then
    . /vagrant/.bashrc
fi
EOF
