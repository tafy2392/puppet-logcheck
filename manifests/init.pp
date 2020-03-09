
class logcheck (
       Boolean $log_summary = true,
       String $email = 'tafymunya@gmail.com',
       String $password = 'tafy1992', )
       {

  class { 'logcheck::install': } ->
  class { 'logcheck::config': } ->
  class { 'logcheck::mail': password => $password, email => $email, }
  
  if $log_summary {
    class { 'logcheck::summary': }
  }
  
}
