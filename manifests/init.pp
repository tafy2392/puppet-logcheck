
class logcheck (
       Boolean $log_summary = false ,
       String $email = 'praekeltlogcheck@gmail.com',
       String $password = 'Praekelt1234', )
       {

  class { 'logcheck::install': } ->
  class { 'logcheck::config': } ->
  class { 'logcheck::mail': password => $password, email => $email, }
  
  if $log_summary {
    class { 'logcheck::summary': }
  }
  
}
