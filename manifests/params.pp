class shadow::params {

  $pass_min_len_default='5'
  $pass_warn_age_default='7'

  if(hiera('eypshadow::hardening', false))
  {
    #hardening = true
    $pass_max_days_default='90'
    $pass_min_days_default='7'
  }
  else
  {
    $pass_max_days_default='99999'
    $pass_min_days_default='0'
  }

  $encrypt_method_default='SHA512'

  case $::osfamily
  {
    'redhat':
    {
      case $::operatingsystemrelease
      {
        /^[5-6].*$/:
        {
          $package_name='shadow-utils'
          $maildir_default = '/var/spool/mail'
          $sys_uid_min_default = undef
          $sys_uid_max_default = undef
          $sys_gid_min_default = undef
          $sys_gid_max_default = undef
        }
        /^7.*$/:
        {
          $package_name='shadow-utils'
          $maildir_default = '/var/spool/mail'
          $sys_uid_min_default = '201'
          $sys_uid_max_default = '999'
          $sys_gid_min_default = '201'
          $sys_gid_max_default = '999'
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
            /^1[4-7].*$/:
            {
              $package_name='passwd'
              $maildir_default = '/var/spool/mail'
              #TODO sys_gid_min_default ...
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
              $package_name='pwdutils'
              #TODO variables login.defs
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
