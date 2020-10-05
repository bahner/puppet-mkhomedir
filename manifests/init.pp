# @summary Install and enable pam_oddjob_mkhomedir
#
# A description of what this class does
#
# @example
#   include mkhomedir
#
# $pam_service_name::
# The name of the pam.d/FILE to modify
# Debian only.
#
# $pam_module_args:: 
# Arguments to pass to the module, eg. umask=0007 or umask=0077
# Debian only
#
# $enable::
# Wheter to enable or disable the oddjob-mkhomedir module in pam.
class mkhomedir (

  Boolean $enable                 = $mkhomedir::params::enable,
  String  $package_name           = $mkhomedir::params::package_name,
  Boolean $package_ensure         = $mkhomedir::params::package_ensure,
  Array[String] $pam_module_args  = $mkhomedir::params::pam_module_args,
  String  $pam_module_name        = $mkhomedir::params::pam_module_name,
  String  $pam_service_name       = $mkhomedir::params::pam_service_name,

) inherits mkhomedir::params {

  package {
    "mkhomedir_${mkhomedir::package_name}":
      ensure => $mkhomedir::ensure,
      name   => $mkhomedir::package_name,
    ;
  }

  case $facts['os']['family'] {
    'RedHat': { include mkhomedir::redhat.pp }
    default: { include mkhomedir::debian.pp }
  }

}
