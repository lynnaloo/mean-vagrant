# Inspired by https://github.com/TryGhost/Ghost-Vagrant/blob/master/manifests/base.pp

$node_version = "v0.10.26"

file { '/etc/motd':
	content => "
***********************************

  Welcome to the M.E.A.N. Server

- OS:      Ubuntu 14.04
- Node:    ${node_version}
- IP:      192.168.33.20

To start server:
cd mean
grunt

Navigate to http://localhost:3000
***********************************
\n"
}

class { setup:
	node_version => $node_version
}
