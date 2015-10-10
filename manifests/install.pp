class netatalk::install {

  include netatalk::params

  # Install package if ensure is set to present
  package { $netatalk::params::package_name:
    ensure  => $netatalk::params::package_ensure,
  }

}
