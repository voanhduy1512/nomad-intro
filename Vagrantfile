# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "nomad-intro"

  config.vm.define "consul" do |c1|
    c1.vm.hostname = "consul"
    c1.vm.network "private_network", ip: "10.7.0.15"
    c1.vm.provision "shell", inline: "echo 10.7.0.15 > /tmp/cluster_ip"

    c1.vm.provision "shell", inline: "cd /vagrant/consul && make install-server"
    config.vm.provider "virtualbox" do |v|
      v.memory = 256
      v.cpus = 1
    end
  end

  config.vm.define "nomad" do |n|
    n.vm.hostname = "nomad"
    n.vm.network "private_network", ip: "10.7.0.10"
    n.vm.provision "shell", inline: "echo 10.7.0.10 > /tmp/cluster_ip"

    # n.vm.provision "shell", inline: "cd /vagrant/consul && make install-client" # install consul
    # n.vm.provision "shell", inline: "consul join 10.7.0.15"

    n.vm.provision "shell", inline: "cd /vagrant/nomad && make install-server"
    config.vm.provider "virtualbox" do |v|
      v.memory = 256
      v.cpus = 1
    end
  end

  (1..3).each do |d|
    config.vm.define "docker#{d}" do |node|
      node.vm.hostname = "docker#{d}"
      node.vm.network "private_network", ip: "10.7.0.2#{d}" # 10.7.0.21, 10.7.0.22, 10.7.0.23
      node.vm.provision "shell", inline: "echo 10.7.0.2#{d} > /tmp/cluster_ip"

      node.vm.provision "shell", inline: "cd /vagrant/nomad && make install-client"
      config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 1
      end
    end
  end
end



