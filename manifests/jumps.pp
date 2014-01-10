# == Class: iptables::jumps
#
# Setup all the necessary jumps before anything.
#
# === Parameters
#  [*jumps*]
#   The jumps are setup first before we implement the rules, so we create the jumps
#
# === Variables
#
# === Examples
#
#  class { iptables::jumps:
#    jumps => $jumps
#  }
#
# === Authors
#
# Jonathan Shanks <jshanks@nyx.com>
#
# === Copyright
#
# Copyright 2013 Jonathan Shanks
#
class iptables::jumps($jumps = false)
{

  if $jumps and !empty($jumps) {
    create_resources(firewall, $jumps)
  }

}
