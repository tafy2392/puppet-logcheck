class logcheck::summary{
 
 package {'syslog-summary':
    ensure => present,
  }

exec {'exec_name':
    command => 'bash -c "echo SYSLOGSUMMARY=1" >> /etc/logcheck/logcheck.conf',
    path    => '/bin',
     }
}
