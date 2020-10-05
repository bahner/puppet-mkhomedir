# @summary Default settings for mkhomedir
#
# This class set defaults
#
# @example
#   include mkhomedir::params
#
class mkhomedir::params {

  $enable           = true
  $package_name     = 'oddjob-mkhomedir'
  $package_ensure   = 'installed'
  $pam_service_name = 'common-session'
  $pam_module_args  = ['umask=0077']
  $pam_module_name  = 'pam_oddjob_mkhomedir.so'

}
