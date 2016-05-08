job "balancer" {
  region = "global"

  datacenters = ["nomad-intro"]

  constraint {
    attribute = "${meta.balancer}"
    value     = "true"
  }

  # Rolling updates
  update {
    stagger      = "10s"
    max_parallel = 5
  }

  group "balancer" {
    task "fabio" {
      driver = "docker"

      config {
        image = "magiconair/fabio"

        port_map {
          http   = 9999
          static = 9998
        }
      }

      env {
        registry_consul_addr = "${NOMAD_IP_http}:8500"
      }

      service {
        port = "http"

        check {
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }

      resources {
        cpu    = 100
        memory = 32

        network {
          mbits = 100

          port "http" {
            static = 80
          }

          port "ui" {
            static = 9998
          }
        }
      }
    }
  }
}
