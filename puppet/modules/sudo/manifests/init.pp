class sudo {

  package { 'sudo':
    ensure => installed
  }

  file_line { 'sudoers':
    path    => '/etc/sudoers',
    line    => '%wheel ALL=(ALL) NOPASSWD: ALL',
    match   => '^(# )?%wheel ALL=\(ALL\) NOPASSWD: ALL$',
    require => Package['sudo']
  }

}
