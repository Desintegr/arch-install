class ntp {

  package { 'ntp':
    ensure => installed
  }

  service { 'ntpd':
    enable  => 'true',
    require => Package['ntp']
  }

}
