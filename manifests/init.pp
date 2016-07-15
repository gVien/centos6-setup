# Class: centossetup
# ===========================
#
# Full description of class centossetup here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'centossetup':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#

# create user deployer
# install packages
# create shell to run install all the development tools
# including ruby, rails, etc
# create directory "/var/www/texter" and allow user deployer to have access
#
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

  file { 'ruby-rails-install-script':
        ensure => 'file',
        path => '/root/install.sh',
        owner => 'root',
        group => 'root',
        mode  => '0755',
        notify => Exec['install-script'],
    }

  exec { 'install-script':
    command => "/root/install.sh",
  }

  package { ['epel-release', 'nodejs']:
        ensure => present,
  }
}

include centossetup