package { "lighttpd":
  ensure => "installed",
}

service { "lighttpd":
  ensure => running,
  enable => true,
  require => Package["lighttpd"],
}