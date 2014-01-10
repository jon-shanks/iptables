# == Class: iptables::pre
#
# This module is responsible for applying the pre rules before any other rules on the box, these will be rules
# you want applied to the box straight away. 
#
# === Parameters
#
#  [*rules*]
#   The rules to apply, this is a merged hash using module_hiera_hash custom function
#
# === Variables
#
# === Examples
#
#  class { iptables::pre:
#    rules => $pre
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
class iptables::pre($rules = false)
{

  if $rules and !empty($rules) {
    create_resources(firewall, $rules)
  }

}
