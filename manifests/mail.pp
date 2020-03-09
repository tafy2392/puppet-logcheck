class logcheck::mail {
 
  package{'msmtp':
    ensure => installed, 
  }
  
  package {'mutt':
    ensure => installed,
 }

 file {'/root/.forward':
    ensure  => present,
    content => template('logcheck/forward.erb'),
    owner   => root,
    group   => root,
    mode    => '0600',
  }

  
  file {'/etc/msmtprc':
    ensure  => present,
    content => template('logcheck/msmtprc.erb'),
    owner   => root,
    group   => root,
    mode    => '0600',
  }

  file {'/usr/bin/msmtp':
    ensure => link,
    force => true,
    target => '/usr/sbin/sendmail',
  }
  
 
}
