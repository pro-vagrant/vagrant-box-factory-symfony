class { 'apache':
    stage         => main,
    mpm_module    => prefork,
    user          => vagrant,
    group         => vagrant,
    default_vhost => false;
}

class {'::apache::mod::rewrite': }

class {'::apache::mod::php':
    path => "${::apache::params::lib_path}/libphp5.so",
}

apache::vhost { 'app.lh':
    port          => '80',
    docroot       => '/vagrant/web',
    docroot_owner => 'vagrant',
    docroot_group => 'vagrant',

    directories  => [
        { path => '/vagrant/web',
            allow_override => ['All'],
        },
    ],

    notify        => Service['apache2'],
}
