class support {
  group { "puppet" :
    ensure => present,
    name => "puppet";
  }

  Package { ensure => installed }

  package {
    ["curl",
    "libssl-dev",
    "git-core",
    "build-essential"
    ]:
  }

  file { "/home/vagrant/mean":
    ensure => "directory"
  }
}
