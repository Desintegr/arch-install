class grub {

  package { 'grub':
    ensure => installed
  }

  file_line { 'ifnames':
    path    => '/etc/default/grub',
    line    => 'GRUB_CMDLINE_LINUX_DEFAULT="quiet net.ifnames=0"',
    match   => '^GRUB_CMDLINE_LINUX_DEFAULT=',
    require => Package['grub'],
    notify  => Exec['grub-mkconfig']
  }

  exec { 'grub-mkconfig':
    command     => '/usr/bin/grub-mkconfig -o /boot/grub/grub.cfg',
    refreshonly => true,
    notify      => Exec['grub-install']
  }

  package { 'binutils':
    ensure => installed
  }

  exec { 'grub-install':
    command => '/usr/bin/grub-install /dev/sda',
    require => Package['binutils'],
    unless  => '/usr/bin/dd if=/dev/sda bs=512 count=1 2> /dev/null | /usr/bin/strings | /usr/bin/grep GRUB'
  }

}
