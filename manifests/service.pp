class shadow::service inherits shadow {

  #
  validate_bool($shadow::manage_docker_service)
  validate_bool($shadow::manage_service)
  validate_bool($shadow::service_enable)

  validate_re($shadow::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${shadow::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $shadow::manage_docker_service)
  {
    if($shadow::manage_service)
    {
      service { $shadow::params::service_name:
        ensure => $shadow::service_ensure,
        enable => $shadow::service_enable,
      }
    }
  }
}
