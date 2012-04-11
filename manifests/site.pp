package { "lighttpd":
  ensure => "installed",
}

service { "lighttpd":
  ensure => running,
  enable => true,
  require => Package["lighttpd"],
}

file { "/var/www":
  ensure => directory,
  before => File["/var/www/index.htm"],
}

file { "/etc/lighttpd/lighttpd.conf":
	source => "puppet:///modules/devops-sg-demo/lighttpd.conf",
	notify => Service['lighttpd'],
}

file { "/var/www/index.htm":
	source => "puppet:///modules/devops-sg-demo/index.htm"
}

