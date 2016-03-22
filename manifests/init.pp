# Class: samplepuppetmodule
# ===========================
#
# Full description of class samplepuppetmodule here.
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
#    class { 'samplepuppetmodule':
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
class samplepuppetmodule {

  package { 'httpd':
    ensure => 'installed',
    allow_virtual => true
  }

  service { 'httpd':
    ensure => 'running',
    enable => true,
    require => Package['httpd']
  }

  file { '/etc/httpd/conf.d/testfilter.conf':
    notify  => Service['httpd'],
    ensure => 'file',
    content => template('samplepuppetmodule/testfilter.conf.erb'),
    require => Package['httpd']
  }

  # Bad file
  file { '/var/www/html/AUX':
    ensure => 'directory',
    require => Package['httpd']
  }
  file { '/var/www/html/AUX/.aspx':
    ensure => 'file',
    content => "CANTSEETHIS!\n",
    require => Package['httpd']
  }

  # Good file
  file { '/var/www/html/bacon':
    ensure => 'directory',
    require => Package['httpd']
  }
  file { '/var/www/html/bacon/tasty.txt':
    ensure => 'file',
    content => "CANSEETHIS!\n",
    require => Package['httpd']
  }

}

include samplepuppetmodule
