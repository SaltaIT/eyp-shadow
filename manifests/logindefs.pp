class shadow::logindefs (
                          $maildir        = $shadow::params::maildir_default,
                          $pass_max_days  = $shadow::params::pass_max_days_default,
                          $pass_min_days  = $shadow::params::pass_min_days_default,
                          $pass_min_len   = $shadow::params::pass_min_len_default,
                          $pass_warn_age  = $shadow::params::pass_warn_age_default,
                          $uid_min        = '1000',
                          $uid_max        = '60000',
                          $gid_min        = '1000',
                          $gid_max        = '60000',
                          $sys_uid_min    = $shadow::params::sys_uid_min_default,
                          $sys_uid_max    = $shadow::params::sys_uid_max_default,
                          $sys_gid_min    = $shadow::params::sys_gid_min_default,
                          $sys_gid_max    = $shadow::params::sys_gid_max_default,
                          $encrypt_method = $encrypt_method_default,
                        ) inherits shadow {
  include ::shadow

  Class['::shadow::install'] ->
  class { '::shadow::logindefs::config': } ->
  Class['::shadow::logindefs']

  case $::osfamily
  {
    'redhat':
    {
      case $::operatingsystemrelease
      {
        /^[6-7].*$/:
        {
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    'Debian':
    {
      case $::operatingsystem
      {
        'Ubuntu':
        {
          case $::operatingsystemrelease
          {
            /^1[468].*$/:
            {
            }
            default: { fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")  }
          }
        }
        'Debian': { fail('Unsupported')  }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    'Suse':
    {
      case $::operatingsystem
      {
        'SLES':
        {
          case $::operatingsystemrelease
          {
            '11.3':
            {
              fail('not implemented')
            }
            default: { fail("Unsupported operating system ${::operatingsystem} ${::operatingsystemrelease}") }
          }
        }
        default: { fail("Unsupported operating system ${::operatingsystem}") }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
