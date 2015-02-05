include stdlib
include mysql::server
include ::apache::mod::rewrite
include php5
include environment
include nodejs

class {
    'ubuntu': stage => setup, action => 'clean';
}

exec { 'install less node module':
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => 'npm install -g less &> /dev/null',
    require => Class['nodejs'],
}

class { 'php_phars':
    all   => true,
}

class { 'apache':
    mpm_module    => prefork,
    user          => vagrant,
    group         => vagrant,
    default_vhost => false,
    require       => Class['php5'];
}

class {'::apache::mod::php':
    path => "${::apache::params::lib_path}/libphp5.so",
}

apache::vhost { 'app.lh':
    port          => '80',
    docroot       => '/vagrant/web',
    docroot_owner => 'vagrant',
    docroot_group => 'vagrant',
    notify        => Service['apache2'],
    directories   => [
        { path => '/vagrant/web',
            allow_override => ['All'],
        },
    ],
}
