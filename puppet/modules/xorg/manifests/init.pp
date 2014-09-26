class xorg {

  package { 'xorg-server':
    ensure => installed
  }

  file { '/etc/X11/xorg.conf.d/10-keyboard.conf':
    ensure  => file,
    source  => 'puppet:///modules/xorg/keyboard.conf',
    require => Package['xorg-server']
  }

}