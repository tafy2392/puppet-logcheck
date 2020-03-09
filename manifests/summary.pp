class logcheck::summary{
 
 package {'syslog-summary':
    ensure => present,
  }

  file {'/etc/logcheck/logcheck.conf':
    ensure => present,
  }

  -> file_line { 'syssum_line':
        line => 'SYSLOGSUMMARY=1',
        path => '/etc/logcheck/logcheck.conf',
  }
  

}
