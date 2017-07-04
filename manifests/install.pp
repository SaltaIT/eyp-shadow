class shadow::install inherits shadow {

  if($shadow::manage_package)
  {
    package { $shadow::params::package_name:
      ensure => $shadow::package_ensure,
    }
  }

}
