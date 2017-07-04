class shadow::logindefs::config inherits shadow::logindefs {

  file { '/etc/login.defs':
    ensure  => 'present',
    group   => 'root',
    owner   => 'root',
    mode    => '0644',
    content => template("${module_name}/logindefs/logindefs.erb"),
  }

}
