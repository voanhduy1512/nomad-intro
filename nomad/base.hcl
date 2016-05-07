bind_addr = "0.0.0.0"

datacenter = "nomad-intro"

enable_syslog = true

syslog_facility = "LOCAL0"

log_level = "DEBUG"

data_dir = "/var/lib/nomad"

advertise {
  rpc  = "SELFIP:4647"
  serf = "SELFIP:4648"
}
