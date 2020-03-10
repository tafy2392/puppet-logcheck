
class prk_logcheck (
  Boolean $log_summary = false ,
  String $email = 'praekeltlogcheck@gmail.com',
  String $password = 'Praekelt1234', )
  {

  class { 'prk_logcheck::install': }
  -> class { 'prk_logcheck::config': email => $email, }
  -> class { 'prk_logcheck::mail': password => $password, email => $email, }

  if $log_summary
  {
    class { 'prk_logcheck::summary': }
  }

  }
