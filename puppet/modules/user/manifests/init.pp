define customUser {

  user { $name:
    ensure     => present,
    managehome => true,
    groups     => ['wheel'],
    shell      => '/bin/zsh',
    require    => Package['zsh']
  }

  if $name == 'root' {
    $home = ''
  }
  else {
    $home = '/home'
  }

  file { "${home}/${name}/.vimrc":
    ensure  => file,
    source  => 'puppet:///modules/user/vimrc',
    owner   => "${name}",
    group   => "${name}",
    require => User["${name}"]
  }

  file { "${home}/${name}/.zlogout":
    ensure  => file,
    source  => 'puppet:///modules/user/zlogout',
    owner   => "${name}",
    group   => "${name}",
    require => User["${name}"]
  }

  file { "${home}/${name}/.zshenv":
    ensure  => file,
    source  => 'puppet:///modules/user/zshenv',
    owner   => "${name}",
    group   => "${name}",
    require => User["${name}"]
  }

  file { "${home}/${name}/.zshrc":
    ensure  => file,
    source  => 'puppet:///modules/user/zshrc',
    owner   => "${name}",
    group   => "${name}",
    require => User["${name}"]
  }

  file { "${home}/${name}/.zshrc.local":
    ensure  => file,
    content => '',
    owner   => "${name}",
    group   => "${name}",
    require => User["${name}"]
  }

}

class user {

  package { 'zsh':
    ensure => installed
  }

  customUser { 'root':
  }

  customUser { 'damien':
  }

  customUser { 'nicolas':
  }

}
