job "swarm" {
  region = "global"

  datacenters = ["nomad-intro"]

  type = "system"

  group "swarm" {
    task "swarm-client" {
      driver = "docker"

      config {
        image   = "swarm"
        command = "join"

        args = [
          "--advertise=${NOMAD_IP_http}:2375",
          "consul://10.7.0.15:8500",
        ]
      }

      resources {
        cpu    = 100
        memory = 32

        network {
          mbits = 100

          port "http" {}
        }
      }
    }
  }
}
