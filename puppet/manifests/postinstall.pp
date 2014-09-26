node default {
  include grub
  include user
  include sudo
  include ssh
  include netctl
  include ntp
  include xorg
  include packages
}
