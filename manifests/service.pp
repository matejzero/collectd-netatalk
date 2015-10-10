class netatalk::service {

  include netatalk::params

  # Make sure service_ensure parameter is properly set
  if ! ($netatalk::params::service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  # If puppet manages service, start it!
  if $netatalk::params::service_manage == true {
    service { $netatalk::params::service_name:
      ensure     => $netatalk::params::service_ensure,
      enable     => $netatalk::params::service_enable,
      hasstatus  => true,
      hasrestart => true,
    }
  }

}
