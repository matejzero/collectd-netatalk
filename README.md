# Netatalk module for Puppet

## Description
This is a puppet module for installing, configuring and managing netatalk AFP daemon v3. It's pretty simple and not all options are parametrized.

## Usage

This module is made out of 3 parts (installation, configuration and service control).

#### Installation
Make sure your distribution has it in it's repository. For example, it's not available in CentOS.
```puppet
class {'netatalk::install': }
```
#### Configuration
* `hostname` specifies the name of the server clients will see
* `users` hash containing all the users
  * `user` is the username, client will use to logon
  * `valid_users` is an array of users, that have access to a share
  * `time_machine` tells the server if time machine should be enabled for this share
  * `size` is the size of the share in MB

```puppet
class { 'netatalk::config':
  hostname => 'storage-server',
  users    => {
    'user1'  => {
      user         => 'user1',
      valid_users  => ['user1'],
      time_machine => true,
      size         => 1000000,
    },
  }
}
```

#### Service control:
```puppet
class { 'netatalk::service': }
```

## Contributors

Only me so far:)

## License

A short snippet describing the license (MIT, Apache, etc.)

