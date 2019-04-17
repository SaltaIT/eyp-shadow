class shadow(
              $manage_package = true,
              $package_ensure = 'installed',
            ) inherits shadow::params{

  class { '::shadow::install': }
  -> class { '::shadow::config': }
  -> Class['::shadow']

}
