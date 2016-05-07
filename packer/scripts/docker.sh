#!/bin/bash

# enable memory and swap cgroup
perl -p -i -e 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"/g'  /etc/default/grub
/usr/sbin/update-grub

# install docker
curl -sSL https://get.docker.com/ | sh
echo 'DOCKER_OPTS="-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock"' > /etc/default/docker

sudo usermod -a -G docker vagrant
