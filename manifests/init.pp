class netatalk {

# Puppet module for setting up netatalk daemon for AFP Apple network shares
# It is simple to use and provides a few possible configurations
#
# Usage:
#  # Install package (needs arnes_centos repo)
#  include netatalk::install
#  # Configure the class
#  class { 'netatalk::config':
#    users => {
#      'test' => {
#       user             => "test",
#         valid_users      => ["test", "test1"],
#         time_machine     => true,
#         size             => 1000000,
#      },
#      'test5' => { },
#     }
#   }
#   # Enable service
#   include netatalk::service

}