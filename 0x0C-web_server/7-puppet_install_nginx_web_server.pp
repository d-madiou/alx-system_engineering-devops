# This Puppet manifest installs Nginx, sets up Hello World at /, and a 301 redirect at /redirect_me

package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure => running,
}

file { '/var/www/html/index.nginx-debian.html':
  ensure  => file,
  content => "Hello World!\n",
  require => Package['nginx'],
}

file_line { 'add 301 redirect':
  path  => '/etc/nginx/sites-available/default',
  after => 'listen 80 default_server;',
  line  => "\tlocation /redirect_me {\n\t\treturn 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\n\t}",
  require => Package['nginx'],
}

exec { 'reload nginx':
  command     => '/etc/init.d/nginx reload',
  refreshonly => true,
  subscribe   => [File['/var/www/html/index.nginx-debian.html'], File_line['add 301 redirect']],
}
