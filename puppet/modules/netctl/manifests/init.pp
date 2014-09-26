class netctl {

  package { 'netctl':
    ensure => installed
  }

  file { '/etc/netctl/ethernet-dhcp':
    ensure  => file,
    source  => 'puppet:///modules/netctl/ethernet-dhcp',
    require => Package['netctl'],
    notify  => Exec['netctl']
  }

  exec { 'netctl':
    command => '/usr/bin/netctl reenable ethernet-dhcp',
    refreshonly => true
  }

}
