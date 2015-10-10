class netatalk::config (
  $users             = {},
  $ensure            = present,
  $hostname          = $::hostname,
) {

  include netatalk::params

  validate_hash($users)

  # should be loaded after global plugin configuration
  $config_file = '/etc/netatalk/afp.conf'

  concat{ $config_file:
    ensure         => $ensure,
    mode           => '0644',
    owner          => 'root',
    group          => 'root',
    notify         => Service[$netatalk::params::service_name],
    ensure_newline => true,
  }

  concat::fragment{'netatalk_config_header':
    order   => '00',
    content => template('netatalk/afp-header.conf.erb'),
    target  => $config_file,
  }

  create_resources(netatalk::config::user, $users)

}
