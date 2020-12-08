# @summary Install and configures mkhomedir or vice versa 
#
# @api private
#
# The class can install or uninstall, enable or disable pam_mkhomedir
# on RedHat family systems. If the oddjob package isnæt installed,
# If the oddjob-mkhomedir isn't installed pam_mkhomedir can still 
# be enabled, default to standard pam_mkhomedir.
#
# This class is dependent on yguenane/authconfig.
#
# @example
#   include mkhomedir
class mkhomedir::redhat {

  class {
    'authconfig':
      mkhomedir => $mkhomedir::enable,
    ;
  }

}
