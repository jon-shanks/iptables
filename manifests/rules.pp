# == Class: iptables::rules
#
# This module is responsible for applying all other rules between the pre and post.
#
# === Parameters
#
#  [*all_rules*]
#   The rules to apply, this is a merged hash using module_hiera_hash custom function
#
# === Variables
#
# === Examples
#
#  class { iptables::rules:
#    rules => $rules
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
class iptables::rules($all_rules = false)
{

  if $all_rules and !empty($all_rules) {
    create_resources(firewall, $all_rules)
  }

}
