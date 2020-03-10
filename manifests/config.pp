
class logcheck::config(String $email,) {
  file {  '/etc/logcheck/logcheck.conf':
    ensure  => present,
    content => template('logcheck/logcheckconf.erb'),
    owner   => root,
    group   => logcheck,
    mode    => '0666',
   }

# Files to scan  for patterns
   file {  '/etc/logcheck/logcheck.logfiles' :
    ensure  => present,
    content => template('logcheck/logfiles.erb'),
    owner   => root,
    group   => logcheck,
    mode    => '0666',
   }

  #Security Alert Layers Directories for Logcheck
   $mysecdir = [ '/etc/logcheck/cracking.d/', '/etc/logcheck/cracking.ignore.d/', '/etc/logcheck/violations.d/',
              '/etc/logcheck/violations.ignore.d/', '/etc/logcheck/violations.ignore.d.server/', ]
   file { $mysecdir:
     ensure => 'directory',
     owner => root,
     group => logcheck,
     mode   =>  '0760',
  }


}
