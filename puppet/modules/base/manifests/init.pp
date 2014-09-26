class base {

  file_line { 'mkinitcpio':
    path   => '/etc/mkinitcpio.conf',
    line   => 'HOOKS="base udev autodetect modconf block lvm2 filesystems keyboard fsck"',
    match  => '^HOOKS=',
    notify => Exec['mkinitcpio']
  }

  exec { 'mkinitcpio':
    command => '/usr/bin/mkinitcpio -p linux',
    refreshonly => true
  }

  file { '/etc/hostname':
    ensure => file,
    source => 'puppet:///modules/base/hostname'
  }

  file { '/etc/localtime':
    ensure => link,
    target => '/usr/share/zoneinfo/Europe/Paris'
  }

  file_line { 'locale.gen':
    path   => '/etc/locale.gen',
    line   => 'fr_FR.UTF-8 UTF-8  ',
    match  => '^#?fr_FR.UTF-8 UTF-8  ',
    notify => Exec['locale-gen']
  }

  exec { 'locale-gen':
    command => '/usr/bin/locale-gen',
    refreshonly => true
  }

  file { '/etc/locale.conf':
    ensure => file,
    source => 'puppet:///modules/base/locale.conf'
  }

  file { '/etc/vconsole.conf':
    ensure => file,
    source => 'puppet:///modules/base/vconsole.conf'
  }

}
