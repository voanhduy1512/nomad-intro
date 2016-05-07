install-server:
	sed 's/SELFIP/'`cat /tmp/cluster_ip`'/g' /vagrant/nomad/base.hcl > /etc/nomad.d/base.hcl
	cp /vagrant/nomad/server.hcl /etc/nomad.d/server.hcl
	cp /vagrant/nomad/client.hcl /etc/nomad.d/client.hcl
	cp /vagrant/nomad/server-client.hcl /etc/nomad.d/server-client.hcl
	# Setup nomad service and start it
	cp /vagrant/nomad/nomad.upstart.conf /etc/init/nomad.conf
	restart nomad || start nomad
	sleep 1

install-client:
	sed 's/SELFIP/'`cat /tmp/cluster_ip`'/g' /vagrant/nomad/base.hcl > /etc/nomad.d/base.hcl
	cp /vagrant/nomad/client.hcl /etc/nomad.d/client.hcl
	# Setup nomad service and start it
	cp /vagrant/nomad/nomad.upstart.conf /etc/init/nomad.conf
	restart nomad || start nomad
	sleep 1
