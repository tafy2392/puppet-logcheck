
class logcheck (
       Boolean $log_summary = false,)
       {

  class { 'logcheck::install': } ->
  class { 'logcheck::config': } ->
  class { 'logcheck::mail':}
  
  if $log_summary {
    class { 'logcheck::summary': }
  }
  
}
