class logcheck::config {
  file {  '/etc/logcheck/logcheck.conf':
    ensure  => present,
    content => template('logcheck/logcheckconf.erb'),
    owner   => root,
    group   => root,
    mode    => '0600',
   }

# Files to scan  for patterns
   file {  '/etc/logcheck/logcheck.logfiles' :
    ensure  => present,
    content => template('logcheck/logfiles.erb'),
    owner   => root,
    group   => root,
    mode    => '0600',
   }

  #Security Alert Layers Directories for Logcheck
   $mysecdir = [ '/etc/logcheck/cracking.d/', '/etc/logcheck/cracking.ignore.d/', '/etc/logcheck/violations.d/',
              '/etc/logcheck/violations.ignore.d/', '/etc/logcheck/violations.ignore.d.server/', ]
   file { $mysecdir:
     ensure => 'directory',
     mode   =>  '0644',
  }

  file {  '/etc/logcheck/ignore.d.server':
    ensure  => present,
    content => template('logcheck/ignore.server.erb'),
    owner   => root,
    group   => root,
    mode    => '0600',
  }

}
