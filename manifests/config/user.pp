# a single graphite backend
define netatalk::config::user (
  $ensure           = present,
  $user             = $title,
  $valid_users      = [ $title ],
  $time_machine     = true,
  $size             = 1000000,
  $test_example     = undef,
){

  include netatalk::params
  include netatalk::config

  validate_string($user)
  validate_array($valid_users)
  validate_bool($time_machine)
  # prestaro verzijo stdlib-a imamo in se ne podpira te funkcije
#  validate_integer($size)

  # Users home folder
  $path = "${netatalk::params::afp_root}/${user}"

  # Add user to system
  user { $user:
    ensure  => $ensure,
    comment => "AFP share user ${user}",
    home    => $path,
    shell   => '/sbin/nologin',
  }

  # Create home directory for AFP share
  file { "${user} home dir":
    ensure => directory,
    path   => $path,
    owner  => $user,
    group  => $user,
    mode   => '0700',
  }

  concat::fragment{"netatalk_config_users_${title}":
    ensure  => $ensure,
    order   => '50', # somewhere between header and footer
    target  => $netatalk::config::config_file,
    content => template('netatalk/afp.conf.erb'),
  }
}
