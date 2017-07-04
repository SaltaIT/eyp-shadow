class shadow::useradd (
                        $group    = '100',
                        $home     = '/home',
                        $inactive = '-1',
                        $expire   = undef,
                        $shell    = '/sbin/nologin',
                        $skel     = '/etc/skel',
                      ) inherits shadow {

  Class['::shadow::install'] ->
  class { '::shadow::useradd::config': } ->
  Class['::shadow::useradd']
}
