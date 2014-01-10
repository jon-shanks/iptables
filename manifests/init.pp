# == Class: iptables
#
# This module manages the IPTABLES of the linux machines, utilising the firewall puppet modules
# which provides a firewall provider.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { iptables:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
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
class iptables( $chains     = module_hiera_hash('iptables::chains', false),
                $jumps      = module_hiera_hash('iptables::target_jumps', false),
                $pre        = module_hiera_hash('iptables::pre_rules', false),
                $all_rules  = module_hiera_hash('iptables::rules', false),
                $post       = module_hiera_hash('iptables::post_rules', false), )
{


  class { 'iptables::chains':
    chains  => $chains,
  }

  class { 'iptables::jumps':
    jumps   => $jumps
  }

  class { 'iptables::pre':
    rules   => $pre,
  }

  class { 'iptables::rules':
    all_rules => $all_rules,
  }

  class { 'iptables::post':
    rules => $post,
  }

  Class['iptables::chains'] -> Class['iptables::jumps'] ->  Class['iptables::pre'] -> Class['iptables::rules'] -> Class['iptables::post']
  
}
