# == Class: iptables::chains
#
# Setup all the necessary chains before anything.
#
# === Parameters
#  [*chains*]
#   The chains are setup first before we implement the rules, so we create the chains
#
# === Variables
#
# === Examples
#
#  class { iptables::chains:
#    chains => $chains
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
class iptables::chains($chains = false)
{

  if $chains and !empty($chains) {
    create_resources(firewallchain, $chains)
  }

}
