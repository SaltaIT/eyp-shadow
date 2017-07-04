class shadow::useradd::config inherits shadow {

  file { '/etc/default/useradd':
    ensure  => 'present',
    group   => 'root',
    owner   => 'root',
    mode    => '0600',
    content => template("${module_name}/useradd/useradd.erb"),
  }

}
