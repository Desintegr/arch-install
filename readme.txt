# On Arch LiveCD
loadkeys fr
systemctl start sshd
passwd
ip a show

# Comment package on disable desktop environnement
puppet/manifest/postinstall.pp // la ligne contenant package

# On local machine
export IP=x.x.x.x
ssh-copy-id root@${IP}
scp -r * root@${IP}:
ssh root@${IP}

./install
reboot
