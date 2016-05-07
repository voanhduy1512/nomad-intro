job "consul-server" {
  region = "global"

  datacenters = ["nomad-intro"]

  type = "system"

  constraint {
    attribute = "${meta.consul-server}"
    value     = "true"
  }

  group "consul" {
    task "consul-server" {
      driver = "docker"

      config {
        image        = "gliderlabs/consul"
        network_mode = "host"
        command      = "agent"

        args = [
          "-data-dir",
          "/tmp/consul",
          "-advertise",
          "${NOMAD_IP_consul_8500}",
          "-dc",
          "nomad-intro",
          "-join",
          "10.7.0.15",
          "-encrypt",
          "KnqifJT6qkF0X+Zx9spnjg==",
          "-client",
          "0.0.0.0",
          "-server",
          "-ui",
          "-bootstrap-expect",
          "1",
        ]
      }

      resources {
        cpu    = 100
        memory = 32

        network {
          mbits = 100

          port "consul_8300" {
            static = 8300
          }

          port "consul_8301" {
            static = 8301
          }

          port "consul_8302" {
            static = 8302
          }

          port "consul_8400" {
            static = 8400
          }

          port "consul_8500" {
            static = 8500
          }

          port "consul_8600" {
            static = 8600
          }
        }
      }
    }
  }
}
