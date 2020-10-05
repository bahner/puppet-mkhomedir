# @summary Install and configures mkhomedir or vice versa 
#
# The class can install or uninstall, enable or disable pam_mkhomedir
# on RedHat family systems. If the oddjob package isnæt installed,
# If the oddjob-mkhomedir isn't installed pam_mkhomedir can still 
# be enabled, default to standard pam_mkhomedir.
#
# This class is dependent on herculesteam/augeasproviders_pam
#
# @example
#   include mkhomedir
class mkhomedir::debian {

  $ensure = $mkhomedir::enable ? {
    false   => 'absent',
    default => 'present',
  }

  pam {
    'mkhomedir':
      ensure    => $ensure,
      service   => mkhomedir::pam_service_name,
      type      => 'session',
      control   => 'optional',
      module    => $mkdhomedir::pam_module_name,
      arguments => $mkhomedir::module_arguments,
    ;
  }
}
