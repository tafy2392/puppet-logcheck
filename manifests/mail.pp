class prk_logcheck::mail(String $password, String $email,) {

  package{'msmtp':
    ensure => installed,
  }

  package {'msmtp-mta':
    ensure => installed,
  }

  file {'/root/.forward':
    ensure  => present,
    content => template('logcheck/forward.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }


  file {'/etc/msmtprc':
    ensure  => present,
    content => template('logcheck/msmtprc.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }

  file {'/usr/local/bin/sendmail':
    ensure => link,
    force  => true,
    target => '/usr/bin/msmtp',
    mode   => '0755'
  }

  file {'/usr/local/sbin/sendmail':
    ensure => link,
    force  => true,
    target => '/usr/bin/msmtp',
    mode   => '0755'
  }



}
