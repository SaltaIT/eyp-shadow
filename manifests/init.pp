class shadow(
              $manage_package        = true,
              $package_ensure        = 'installed',
            ) inherits shadow::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::shadow::install': }
  -> class { '::shadow::config': }
  -> Class['::shadow']

}
