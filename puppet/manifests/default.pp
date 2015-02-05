include stdlib

class {
    'ubuntu':      stage => setup, action => 'clean';
    'php5':        stage => main;
    'environment': stage => main;
    'nodejs':      stage => main;
}

exec { 'install less node module':
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => 'npm install -g less &> /dev/null',
    require => Class['nodejs'],
}

class { 'php_phars':
    stage => main,
    all   => true,
}

# Do not create a database.
# It will be done in ./reload.bash
class { 'mysql::server': }

class { 'apache':
    stage         => runtime,
    mpm_module    => prefork,
    user          => vagrant,
    group         => vagrant,
    default_vhost => false,
    require       => Class['php5'];
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
    notify        => Service['apache2'],
    directories   => [
        { path => '/vagrant/web',
            allow_override => ['All'],
        },
    ],
}
