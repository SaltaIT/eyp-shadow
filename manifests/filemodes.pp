class shadow::filemodes() inherits shadow {

  file { '/etc/group-':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }

  file { '/etc/passwd-':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }
}
