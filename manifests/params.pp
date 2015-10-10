class netatalk::params {

  $package_ensure = 'present'
  $package_name   = 'netatalk'

  $service_enable = true
  $service_name   = 'netatalk'
  $service_ensure = 'running'
  $service_manage = true

  $afp_root       = '/afp'

}
