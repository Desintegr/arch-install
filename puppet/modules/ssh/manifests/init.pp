class ssh {

  package { 'openssh':
    ensure => installed
  }

  service { 'sshd':
    enable  => 'true',
    require => Package['openssh']
  }

}
