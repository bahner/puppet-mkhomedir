# @summary Install and enable pam_oddjob_mkhomedir
#
# A description of what this class does
#
# @example
#   include mkhomedir
#
# @param [Boolean] enable
#   Whether to enable or disable the oddjob-mkhomedir module in pam.
#
# @param [String] package_ensure
#   Whether or not to install the oddjob-mkhomedir package,
#   or to remove or purge it. This should prolly be correlated
#   with pam_module_name setting it to something else, if you
#   don't want to installed the package.
#
# @param [String] package_name
#   Name of the package to install.
#
# @param pam_module_name
#   If you just want to use the standard pam_mkhomedir.so instead
#   of the default pam_oddjob_mkhomedir.so than set this value here.
#   Debian only. Authconfig uses pam_oddjob_mkhomedir.so if available.
#   To make use of pam_mkhomedir.so set package_ensure to "purged"
#
# @param [String] pam_service_name
#   The name of the pam.d/FILE to modify
#   Debian only. RedHat modules uses authconfig which handles this.
#
# @param [String] pam_module_args
#   Arguments to pass to the module, eg. umask=0007 or umask=0077
#   Debian only. RedHat modules uses authconfig.
class mkhomedir (

  Boolean $enable                 = true,
  String $package_ensure          = 'installed',
  String  $package_name           = 'oddjob-mkhomedir',
  Array[String] $pam_module_args  = ['umask=0077'],
  String  $pam_module_name        = 'pam_oddjob_mkhomedir.so',
  String  $pam_service_name       = 'common-session',

) {

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
