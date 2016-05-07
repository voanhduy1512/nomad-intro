install-server:
	sed 's/SELFIP/'`cat /tmp/cluster_ip`'/g' /vagrant/consul/consul-server.json > /etc/consul.d/consul.json
	cp /vagrant/consul/consul.upstart.conf /etc/init/consul.conf
	restart consul || start consul
	sleep 1

install-client:
	sed 's/SELFIP/'`cat /tmp/cluster_ip`'/g' /vagrant/consul/consul-client.json > /etc/consul.d/consul.json
	# Setup consul service and start it
	cp /vagrant/consul/consul.upstart.conf /etc/init/consul.conf
	restart consul || start consul
	sleep 1
