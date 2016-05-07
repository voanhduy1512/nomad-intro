client {
  enabled           = true
  network_interface = "eth1"
  servers           = ["10.7.0.10:4647"]

  meta {
    consul-server = "false"
  }
}
