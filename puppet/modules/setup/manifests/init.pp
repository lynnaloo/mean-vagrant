class setup($node_version = "v0.10.26") {
  # Add some default path values
  Exec { path => ['/usr/local/bin','/usr/local/sbin','/usr/bin/','/usr/sbin','/bin','/sbin', "/home/vagrant/nvm/${node_version}/bin"], }

  exec { "apt-update":
      command => "/usr/bin/apt-get update"
  }

  Exec["apt-update"] -> Package <| |>

  # Support packages
  class { support: }

  exec { "git submodule update":
    cwd     => "/home/vagrant/mean",
    command => "git submodule update --init --recursive",
    require => Class["support"]
  }

  # Install Node
  class { 'nvm':
      node_version => $node_version,
      require => [Class["support"]]
  }

  define npm( $directory="/home/vagrant/nvm/${setup::node_version}/lib/node_modules" ) {
    exec { "install-${name}-npm-package":
      unless => "test -d ${directory}/${name}",
      command => "npm install -g ${name}",
      require => Exec['install-node'],
    }
  }

  # Global npm modules
  npm { ["nodemon", "grunt-cli", "bower"]:
  }

  # Make sure our code directory has proper permissions
  file { '/home/mean':
      ensure => "directory",
      owner  => "vagrant",
      group  => "vagrant"
  }

  # Install packages from package.json
  exec { "npm-install-packages":
    cwd => "/home/vagrant/mean",
    command => "npm install",
    require => Exec['install-node'],
  }

  package { 'mongodb':
    ensure => present,
  }

  service { 'mongodb':
    ensure  => running,
    require => Package['mongodb'],
  }

  exec { 'allow remote mongo connections':
    command => "/usr/bin/sudo sed -i 's/bind_ip = 127.0.0.1/bind_ip = 0.0.0.0/g' /etc/mongodb.conf",
    notify  => Service['mongodb'],
    onlyif  => '/bin/grep -qx  "bind_ip = 127.0.0.1" /etc/mongodb.conf',
  }
}
