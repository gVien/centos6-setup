# outline/plan
# create user deployer
# install packages
# create shell to run install all the development tools
# including ruby, rails, etc
# create directory "/var/www/texter" and allow user deployer to have access
class centossetup {

  # create group and user
  group { 'deployer':
    ensure => present,
  }

  user { 'deployer':
    ensure     => present,
    gid        => 'deployer',
    home       => '/home/deployer',
    managehome => true,
  }

  # paths for deployed application
  file { "/var/www":
    ensure    => directory;

   "/var/www/texter":
      ensure    => directory,
      require   => File['/var/www'],
      owner => 'deployer',
      group => 'deployer';
  }

  # development tools
  package { [
      'git-core',
      'zlib',
       'zlib-devel',
       'gcc-c++',
       'patch',
       'readline',
       'readline-devel',
       'libyaml-devel',
       'libffi-devel',
       'openssl-devel',
       'make',
       'bzip2',
       'autoconf',
       'automake',
       'libtool',
       'bison',
       'curl',
       'sqlite-devel'
    ]:
    ensure => installed,
  }

  # exec { 'make install.sh writable':
  #   command => "chmod +x /root/centos6-setup/manifests/install.sh",  # need relative path
  #   path    => "/root/centos6-setup/manifests/"
  # }

  file { 'ruby-rails-install-script':
        ensure => 'file',
        path => '/root/centos6-setup/manifests/install.sh', # need relative path
        owner => 'root',
        group => 'root',
        mode  => '0755',
        notify => Exec['install-script'],
    }

  exec { 'install-script':
    command => "/root/centos6-setup/manifests/install.sh",  # need relative path
  }

  package { ['epel-release', 'nodejs']:
        ensure => present,
  }
}

include centossetup